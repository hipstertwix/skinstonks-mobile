import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skinstonks_mobile/Screens/Signup/components/register_form.dart';
import 'package:skinstonks_mobile/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
