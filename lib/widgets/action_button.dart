import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/config/constants.dart';
import 'package:skinstonks_mobile/widgets/linear_gradient_mask.dart';

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
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [kBoxShadow],
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.5),
          child: LinearGradientMask(
            selected: true,
            child: Icon(
              icon,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
