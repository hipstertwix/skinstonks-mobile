import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/constants.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Function press;

  const SocialIcon({Key? key, required this.icon, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {press()},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: kPrimaryLightColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: kPrimaryHeadingColor,
          ),
        ));
  }
}
