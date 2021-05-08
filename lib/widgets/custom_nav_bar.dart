import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<CustomNavigationBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final double iconSize;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.iconSize = 32.00,
    this.selectedColor = kWhite,
    this.unselectedColor = kPrimaryTextColor,
  }) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 40, left: kSidePadding, right: kSidePadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryLightColor,
              boxShadow: [kBoxShadow],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 5.0, left: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (var i = 0; i < widget.items.length; i++)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        widget.onTap!(i);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13.00, left: 13.00),
                        child: Icon(
                          widget.currentIndex == i
                              ? widget.items[i].selectedIcon
                              : widget.items[i].icon,
                          size: widget.iconSize,
                          color: widget.currentIndex == i
                              ? widget.selectedColor
                              : widget.unselectedColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavigationBarItem {
  final IconData icon;
  final IconData selectedIcon;

  CustomNavigationBarItem({
    required this.icon,
    IconData? selectedIcon,
  }) : selectedIcon = selectedIcon ?? icon;
}
