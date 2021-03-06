import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/screens/welcome/login/components/login_form.dart';
import 'package:skinstonks_mobile/widgets/app_bar.dart';
import 'package:skinstonks_mobile/widgets/background.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mainAppBar("Login"),
      body: Background(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: statusBarHeight + 65),
              LoginForm(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
