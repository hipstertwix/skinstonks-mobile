import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/screens/welcome/signup/components/register_form.dart';
import 'package:skinstonks_mobile/widgets/app_bar.dart';
import 'package:skinstonks_mobile/widgets/background.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mainAppBar("Signup"),
      body: Background(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: statusBarHeight + 65),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
