import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/components/password_input.dart';
import 'package:skinsstonks_mobile/components/rounded_button.dart';
import 'package:skinsstonks_mobile/components/rounded_input.dart';
import 'package:skinsstonks_mobile/constants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  late String errorMessage;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RoundedInput(
            hintText: "Email",
            onchange: (value) {},
            controller: _email,
          ),
          PasswordField(
            hintText: "Password",
            onChanged: (value) {},
            controller: _password,
          ),
          RoundedButton(
            text: "LOGIN",
            color: Colors.white,
            textColor: kPrimaryColor,
            press: () {},
          ),
        ],
      ),
    );
  }
}
