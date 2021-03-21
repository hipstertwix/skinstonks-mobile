import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/background.dart';
import 'package:skinstonks_mobile/Screens/Login/components/login_form.dart';

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
          children: <Widget>[
            SizedBox(height: statusBarHeight + 20),
            LoginForm(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
