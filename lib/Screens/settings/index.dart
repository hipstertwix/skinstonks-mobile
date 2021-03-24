import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/app_header.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader('Settings', titleIcon: Icons.settings_rounded),
      ],
    );
  }
}
