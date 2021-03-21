import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/common.dart';

import 'package:skinstonks_mobile/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getSkinStonksAppBar("Login"),
      body: Body(),
    );
  }
}