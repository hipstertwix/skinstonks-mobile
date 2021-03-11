import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skinsstonks_mobile/Screens/Login/login_screen.dart';
import 'package:skinsstonks_mobile/Screens/Signup/components/register_form.dart';
import 'package:skinsstonks_mobile/components/background.dart';
import 'package:skinsstonks_mobile/components/or_divider.dart';
import 'package:skinsstonks_mobile/components/social_icon.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Background(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: statusBarHeight + 20),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
