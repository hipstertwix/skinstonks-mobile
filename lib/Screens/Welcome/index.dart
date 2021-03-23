import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinstonks_mobile/config/constants.dart';
import 'package:skinstonks_mobile/routes/slide_page_route.dart';
import 'package:skinstonks_mobile/screens/signup/index.dart';
import 'package:skinstonks_mobile/widgets/background.dart';
import 'package:skinstonks_mobile/widgets/have_account_check.dart';
import 'package:skinstonks_mobile/widgets/rounded_button.dart';

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
              "assets/images/Skinstonks_ICON_WHITE.svg",
              width: size.width * 0.38,
              color: Colors.white,
            ),
            SizedBox(height: 30),
            Text(
              "skinstonks",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 0.75 * size.width,
              child: Text(
                "Go making big money by registering to this total legit and not scam mobile app.",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.15 * size.height),
            RoundedButton(
              child: Text("GET STARTED"),
              textColor: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  SlidePageRoute(widget: SignupScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            HaveAccountCheck(),
          ],
        ),
      ),
    );
  }
}
