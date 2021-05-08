import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/home_header.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader('Notifications', titleIcon: Icons.notifications_rounded),
      ],
    );
  }
}
