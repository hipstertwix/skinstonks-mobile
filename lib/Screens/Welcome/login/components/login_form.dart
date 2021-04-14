import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/widgets/buttons/rounded_button.dart';
import 'package:skinstonks_mobile/widgets/forms/password_input.dart';
import 'package:skinstonks_mobile/widgets/forms/rounded_input.dart';
import 'package:skinstonks_mobile/widgets/loading_ring.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
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
  bool loading = false;

  submit(AuthService authService) async {
    setState(() => loading = true);
    LoginModel loginUserData = new LoginModel(_username.value.text, _password.value.text);

    try {
      await authService.login(loginUserData);
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
          SizedBox(height: 12),
          RoundedButton(
            child: loading ? LoadingRing(color: kWhite) : Text('LOGIN'),
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
