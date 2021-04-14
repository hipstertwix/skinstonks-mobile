import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/widgets/buttons/rounded_button.dart';
import 'package:skinstonks_mobile/widgets/forms/password_input.dart';
import 'package:skinstonks_mobile/widgets/forms/rounded_input.dart';
import 'package:skinstonks_mobile/widgets/loading_ring.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
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
  bool loading = false;

  submit(AuthService authService) async {
    setState(() => loading = true);
    RegisterModel registerUserData =
        new RegisterModel(_username.value.text, _email.value.text, _password.value.text);

    try {
      await authService.register(registerUserData);
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          backgroundColor: kErrorColor,
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
          SizedBox(height: 12),
          RoundedButton(
            child: loading ? LoadingRing(color: kWhite) : Text('SIGNUP'),
            press: () {
              submit(authService);
            },
            color: kAccentColor,
            textColor: kWhite,
          ),
        ],
      ),
    );
  }
}
