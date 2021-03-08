import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/constants.dart';


class HaveAccountCheck extends StatelessWidget {

  final bool login;
  final Function press;

  const HaveAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an account? " : "Already have an account? ",
          style: TextStyle(
              color: kPrimaryColor
          ),
        ),
        GestureDetector(
            onTap: () => {
              press()
            },
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: TextStyle(
                color: kPrimaryHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            )
        )
      ],
    );
  }
}
