import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skinstonks_mobile/components/password_input.dart';
import 'package:skinstonks_mobile/components/rounded_button.dart';
import 'package:skinstonks_mobile/components/rounded_input.dart';
import 'package:skinstonks_mobile/components/loading_ring.dart';
import 'package:skinstonks_mobile/constants.dart';
import 'package:skinstonks_mobile/model/user/register_model.dart';
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
    Response response = await AuthService.register(registerUserData);
    setState(() {
      errorMessage = response.body;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
