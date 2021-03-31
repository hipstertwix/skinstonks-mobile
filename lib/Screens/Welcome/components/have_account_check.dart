import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/routes/slide_page_route.dart';
import 'package:skinstonks_mobile/screens/welcome/login/index.dart';

class HaveAccountCheck extends StatelessWidget {
  const HaveAccountCheck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already have an account? ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              SlidePageRoute(widget: LoginScreen()),
            )
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
