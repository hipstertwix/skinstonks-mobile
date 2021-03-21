import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/password_input.dart';
import 'package:skinstonks_mobile/widgets/rounded_button.dart';
import 'package:skinstonks_mobile/widgets/rounded_input.dart';
import 'package:skinstonks_mobile/widgets/loading_ring.dart';
import 'package:skinstonks_mobile/config/constants.dart';
import 'package:skinstonks_mobile/models/user/register_model.dart';
import 'package:skinstonks_mobile/services/auth.dart';

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
    RegisterModel registerUserData =
        new RegisterModel(_username.value.text, _email.value.text, _password.value.text);
    final response = await AuthService.register(registerUserData);
    if (response.statusCode != 200) {
      setState(() {
        errorMessage = response.body;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RoundedInput(labelText: "Username", onchange: (value) {}, controller: _username),
          RoundedInput(
            labelText: "Email",
            icon: Icons.email,
            iconSize: 21,
            iconPadding: EdgeInsets.only(right: 9),
            onchange: (value) {},
            controller: _email,
          ),
          PasswordField(
            labelText: "Password",
            onChanged: (value) {},
            controller: _password,
          ),
          PasswordField(
            labelText: "Confirm password",
            onChanged: (value) {},
            controller: _confirmPassword,
          ),
          if (errorMessage != "")
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          RoundedButton(
            child: loading ? LoadingRing() : Text('SIGNUP'),
            press: () {
              submit();
            },
            color: Colors.white,
            textColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
