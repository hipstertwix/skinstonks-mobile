import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/action_button.dart';
import 'package:skinstonks_mobile/widgets/app_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader('Listings',
            titleIcon: Icons.star_rounded,
            titleIconSize: 23,
            actionButton: ActionButton(
              icon: Icons.filter_alt_rounded,
              iconSize: 24,
              onPressed: () {},
            )),
      ],
    );
  }
}
