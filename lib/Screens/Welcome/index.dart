import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/routes/transitions/slide_route.dart';
import 'package:skinstonks_mobile/screens/welcome/login/index.dart';
import 'package:skinstonks_mobile/screens/welcome/signup/index.dart';
import 'package:skinstonks_mobile/widgets/background.dart';
import 'package:skinstonks_mobile/widgets/buttons/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/Skinstonks_LOGO_WHITE.svg",
              width: size.width * 0.45,
              color: Colors.white,
              allowDrawingOutsideViewBox: true,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 0.75 * size.width,
              child: Text(
                "Go making big money by registering to this total legit and not scam mobile app.",
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.2 * size.height),
            RoundedButton(
              child: Text("GET STARTED"),
              color: kAccentColor,
              textColor: kWhite,
              press: () {
                Navigator.push(
                  context,
                  SlideRoute(enterPage: SignupScreen(), exitPage: this),
                );
              },
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  SlideRoute(enterPage: LoginScreen(), exitPage: this),
                )
              },
              child: Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
