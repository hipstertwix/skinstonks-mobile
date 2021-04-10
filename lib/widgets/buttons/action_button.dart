import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final void Function() onPressed;

  ActionButton({
    Key? key,
    required this.icon,
    this.iconSize = 24,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(0, 10.0), blurRadius: 20.0)
        ],
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.5),
          child: Icon(
            icon,
            size: iconSize,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
