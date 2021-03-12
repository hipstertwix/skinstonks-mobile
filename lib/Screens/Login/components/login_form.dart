import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skinstonks_mobile/components/password_input.dart';
import 'package:skinstonks_mobile/components/rounded_button.dart';
import 'package:skinstonks_mobile/components/rounded_input.dart';
import 'package:skinstonks_mobile/components/loading_ring.dart';
import 'package:skinstonks_mobile/constants.dart';
import 'package:skinstonks_mobile/model/user/login_model.dart';
import 'package:skinstonks_mobile/services/auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String errorMessage = "";
  bool loading = false;

  submit() async {
    setState(() => loading = true);
    LoginModel loginUserData = new LoginModel(_username.value.text, _password.value.text);
    Response response = await AuthService.login(loginUserData);
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
          RoundedInput(
            hintText: "Username",
            onchange: (value) {},
            controller: _username,
          ),
          PasswordField(
            hintText: "Password",
            onChanged: (value) {},
            controller: _password,
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
            child: loading ? LoadingRing() : Text('LOGIN'),
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
