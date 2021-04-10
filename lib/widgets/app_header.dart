import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

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
      padding: EdgeInsets.only(left: kSidePadding, right: kSidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              if (titleIcon != null)
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    titleIcon,
                    color: kWhite,
                    size: titleIconSize,
                  ),
                ),
              Text(
                titleText,
                style: TextStyle(
                  color: kWhite,
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
