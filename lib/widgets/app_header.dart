import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/config/constants.dart';
import 'package:skinstonks_mobile/widgets/linear_gradient_mask.dart';

class MainHeader extends StatelessWidget {
  final String titleText;
  final IconData? titleIcon;
  final double titleIconSize;
  final Widget? actionButton;

  const MainHeader(
    this.titleText, {
    Key? key,
    this.titleIcon,
    this.titleIconSize = 21,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              if (titleIcon != null)
                LinearGradientMask(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      titleIcon,
                      color: kPrimaryColor,
                      size: titleIconSize,
                    ),
                  ),
                ),
              Text(
                titleText,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          actionButton != null ? this.actionButton! : SizedBox(height: 42),
        ],
      ),
    );
  }
}
