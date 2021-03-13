import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skinstonks_mobile/Screens/Signup/signup_screen.dart';
import 'package:skinstonks_mobile/components/background.dart';
import 'package:skinstonks_mobile/components/have_account_check.dart';
import 'package:skinstonks_mobile/components/rounded_button.dart';
import 'package:skinstonks_mobile/components/slide_animation.dart';
import 'package:skinstonks_mobile/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
    );
  }
}
