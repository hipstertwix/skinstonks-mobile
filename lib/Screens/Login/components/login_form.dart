import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skinstonks_mobile/screens/home/index.dart';
import 'package:skinstonks_mobile/widgets/password_input.dart';
import 'package:skinstonks_mobile/widgets/rounded_button.dart';
import 'package:skinstonks_mobile/widgets/rounded_input.dart';
import 'package:skinstonks_mobile/widgets/loading_ring.dart';
import 'package:skinstonks_mobile/config/constants.dart';
import 'package:skinstonks_mobile/models/user/login_model.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final storage = new FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String errorMessage = "";
  bool loading = false;

  submit() async {
    setState(() => loading = true);
    LoginModel loginUserData = new LoginModel(_username.value.text, _password.value.text);
    final response = await AuthService.login(loginUserData);
    if (response is Response && response.statusCode == 200) {
      final resBody = json.decode(response.body);
      await storage.write(key: "jwtToken", value: resBody['jwtToken']);
      await storage.write(key: "refreshToken", value: resBody['refreshToken']);
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (Route<dynamic> route) => false,
        arguments: resBody['jwtToken'],
      );
    }
    if (response.statusCode != 200) {
      setState(() {
        errorMessage = response.body;
      });
    }
    setState(() {
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
            labelText: "Username",
            onchange: (value) {},
            controller: _username,
          ),
          PasswordField(
            labelText: "Password",
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
