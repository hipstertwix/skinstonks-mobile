import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skinsstonks_mobile/Screens/Login/login_screen.dart';
import 'package:skinsstonks_mobile/components/have_account_check.dart';
import 'package:skinsstonks_mobile/components/or_divider.dart';
import 'package:skinsstonks_mobile/components/password_input.dart';
import 'package:skinsstonks_mobile/components/rounded_button.dart';
import 'package:skinsstonks_mobile/components/rounded_input.dart';
import 'package:skinsstonks_mobile/components/social_icon.dart';
import 'package:skinsstonks_mobile/constants.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: size.height * 0.05),
        Text(
          "SIGNUP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.05),
        SvgPicture.asset(
          "assets/images/undraw_Group_chat_re_frmo.svg",
          height: size.height * 0.25,
        ),
        SizedBox(height: size.height * 0.05),
        RoundedInput(hintText: "Email", onchange: (value) {}),
        PasswordField(onChanged: (value) {}),
        RoundedButton(text: "SIGNUP", press: () {}, color: kPrimaryColor),
        SizedBox(height: size.height * 0.03),
        HaveAccountCheck(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ));
            }),
        OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocialIcon(
              icon: Icons.bedtime_sharp,
              press: () {},
            )
          ],
        )
      ],
    )));
  }
}
