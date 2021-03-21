import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/common.dart';

import 'package:skinstonks_mobile/Screens/Signup/components/body.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getSkinStonksAppBar("Signup"),
      body: Body(),
    );
  }
}