import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class ActionButton extends StatelessWidget {
  final String? text;
  final double textSize;
  final IconData? icon;
  final double iconSize;
  final void Function() onPressed;

  ActionButton({
    Key? key,
    this.text,
    this.textSize = 14,
    this.icon,
    this.iconSize = 24,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(0, 10.0), blurRadius: 20.0)
        ],
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize,
                  color: kWhite,
                ),
              if (text != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: icon == null ? 6 : 4),
                  child: Text(
                    text!,
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: textSize,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
