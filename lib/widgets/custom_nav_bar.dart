import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/config/constants.dart';

class MyCustomNavigationBar extends StatefulWidget {
  final List<MyCustomNavigationBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final double iconSize;
  final Color selectedColor;
  final Color unselectedColor;

  const MyCustomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.iconSize = 32.00,
    this.selectedColor = kPrimaryColor,
    this.unselectedColor = kPrimaryLightColor,
  }) : super(key: key);

  @override
  _MyCustomNavigationBarState createState() => _MyCustomNavigationBarState();
}

class _MyCustomNavigationBarState extends State<MyCustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: kWhite,
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.2),
                offset: Offset(0, 20.0),
                blurRadius: 20.0,
              ),
            ],
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
                      child: RadiantGradientMask(
                        selected: widget.currentIndex == i ? true : false,
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
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyCustomNavigationBarItem {
  final IconData icon;
  final IconData selectedIcon;

  MyCustomNavigationBarItem({
    required this.icon,
    IconData? selectedIcon,
  }) : selectedIcon = selectedIcon ?? icon;
}

class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  final bool selected;
  RadiantGradientMask({required this.child, required this.selected});

  @override
  Widget build(BuildContext context) {
    return !selected
        ? child
        : ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kLinearGradientLightColor, kLinearGradientDarkColor],
            ).createShader(bounds),
            child: child,
          );
  }
}
