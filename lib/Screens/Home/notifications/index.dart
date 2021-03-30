import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/app_header.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader('Notifications', titleIcon: Icons.notifications_rounded),
      ],
    );
  }
}
