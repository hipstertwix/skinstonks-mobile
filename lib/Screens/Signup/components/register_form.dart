import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skinstonks_mobile/components/password_input.dart';
import 'package:skinstonks_mobile/components/rounded_button.dart';
import 'package:skinstonks_mobile/components/rounded_input.dart';
import 'package:skinstonks_mobile/constants.dart';
import 'package:skinstonks_mobile/model/user/register_user_data.dart';
import 'package:skinstonks_mobile/services/login.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  String errorMessage = "";
  bool loading = false;

  submit() async {
    setState(() => loading = true);
    RegisterUserData registerUserData = new RegisterUserData(
        _username.value.text, _email.value.text, _password.value.text, _confirmPassword.value.text);
    Response response = await LoginService.registerNewUser(registerUserData);
    setState(() {
      errorMessage = response.body;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            RoundedInput(hintText: "Username", onchange: (value) {}, controller: _username),
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
            PasswordField(
              hintText: "Confirm password",
              onChanged: (value) {},
              controller: _confirmPassword,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                submit();
              },
              color: Colors.white,
              textColor: kPrimaryColor,
            ),
            Text(errorMessage),
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 3,
        ),
      );
    }
  }
}
