import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/components/main_app_bar.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        titleText: "Sign In",
      ),
      body: Body(),
    );
  }
}
