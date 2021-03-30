import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'text_field_container.dart';

class RoundedInput extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final EdgeInsetsGeometry iconPadding;
  final double iconSize;
  final ValueChanged<String> onchange;
  final TextEditingController controller;

  const RoundedInput({
    Key? key,
    required this.labelText,
    required this.onchange,
    required this.controller,
    this.icon = Icons.person,
    this.iconPadding = const EdgeInsets.only(right: 6),
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        style: textStyle,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: iconPadding,
            child: Icon(
              icon,
              color: kPrimaryDarkColor,
              size: iconSize,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: labelText,
          labelStyle: textStyle,
        ),
      ),
    );
  }
}
