import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/widgets/app_header.dart';
import 'package:skinstonks_mobile/widgets/buttons/rounded_button.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Column(
      children: [
        MainHeader('Settings', titleIcon: Icons.settings_rounded),
        RoundedButton(
          child: Text('LOGOUT'),
          color: kAccentColor,
          fontSize: 16,
          textColor: Colors.white,
          press: () {
            authService.logout();
          },
        )
      ],
    );
  }
}
