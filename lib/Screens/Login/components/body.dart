import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skinsstonks_mobile/Screens/Login/components/background.dart';
import 'package:skinsstonks_mobile/Screens/Signup/signup_screen.dart';
import 'package:skinsstonks_mobile/components/have_account_check.dart';
import 'package:skinsstonks_mobile/components/password_input.dart';
import 'package:skinsstonks_mobile/components/rounded_button.dart';
import 'package:skinsstonks_mobile/components/rounded_input.dart';
import 'package:skinsstonks_mobile/constants.dart';

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
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/images/undraw_secure_login_pdn4.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInput(
              hintText: "Email",
              icon: Icons.person,
              onchange: (value) {},
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            HaveAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
