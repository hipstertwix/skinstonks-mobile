import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/common.dart';

import 'components/body.dart';

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
