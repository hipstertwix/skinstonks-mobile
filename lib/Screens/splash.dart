import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/navigation_service.dart';
import 'package:skinstonks_mobile/widgets/background.dart';
import 'package:skinstonks_mobile/constants/route_paths.dart' as routes;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () async {
        final validateSession =
            await Provider.of<AuthService>(context, listen: false).validateSession();
        if (validateSession == true) {
          Navigator.pushReplacementNamed(context, routes.HomeRoute);
          return;
        }
        Navigator.pushReplacementNamed(context, routes.LoginRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenBody();
  }
}

class SplashScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/Skinstonks_ICON_WHITE.svg",
                width: size.width * 0.3,
                color: Colors.white,
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
