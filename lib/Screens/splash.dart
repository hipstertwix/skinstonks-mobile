import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/connection_status.dart';
import 'package:skinstonks_mobile/widgets/background.dart';
import 'package:skinstonks_mobile/constants/route_paths.dart' as routes;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showRetryButton = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration(milliseconds: 500), () async {
      validate();
    });
  }

  void validate() async {
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    bool hasConnection = await connectionStatus.checkConnection();

    if (hasConnection) {
      final validateSession =
          await Provider.of<AuthService>(context, listen: false).validateSession();
      if (validateSession == true) {
        Navigator.pushReplacementNamed(context, routes.HomeRoute);
        return;
      }
      Navigator.pushReplacementNamed(context, routes.LoginRoute);
    }

    setState(() {
      showRetryButton = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.1),
              child: SvgPicture.asset(
                "assets/images/Skinstonks_ICON_WHITE.svg",
                width: size.width * 0.3,
                color: Colors.white,
              ),
            ),
            if (showRetryButton)
              Positioned(
                bottom: 100,
                child: Stack(
                  children: [_buildRetryButton()],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildRetryButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => validate(),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(kPrimaryTextColor),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
            elevation: MaterialStateProperty.all<double>(15),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryLightColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 21,
                color: kWhite,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                  'Retry Connection',
                  style: TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
