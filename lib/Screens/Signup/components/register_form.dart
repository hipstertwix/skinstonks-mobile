import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/components/password_input.dart';
import 'package:skinsstonks_mobile/components/rounded_button.dart';
import 'package:skinsstonks_mobile/components/rounded_input.dart';
import 'package:skinsstonks_mobile/constants.dart';

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
  late String errorMessage;
  bool loading = false;

  submit() async {
    setState(() => loading = true);
    //
    // if (result is UserCredential) Navigator.pop(context);
    // if (result is AuthFailure) {
    //   setState(() {
    //     loading = false;
    //     errorMessage = result.message;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          RoundedInput(
              hintText: "Username",
              onchange: (value) {},
              controller: _username),
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
            press: () {},
            color: Colors.white,
            textColor: kPrimaryColor,
          )
        ]));
  }
}
