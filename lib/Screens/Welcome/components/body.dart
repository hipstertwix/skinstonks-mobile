import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skinsstonks_mobile/Screens/Login/login_screen.dart';
import 'package:skinsstonks_mobile/Screens/Signup/signup_screen.dart';
import 'package:skinsstonks_mobile/Screens/Welcome/components/background.dart';
import 'package:skinsstonks_mobile/components/rounded_button.dart';
import 'package:skinsstonks_mobile/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          "assets/images/undraw_Outer_space_drqu.svg",
          height: size.height * 0.25,
        ),
        SizedBox(height: size.height * 0.05),
        RoundedButton(
          text: "LOGIN",
          color: kPrimaryColor,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        RoundedButton(
          text: "SIGNUP",
          color: kPrimaryLightColor,
          textColor: kPrimaryHeadingColor,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
        )
      ],
    )));
  }
}
