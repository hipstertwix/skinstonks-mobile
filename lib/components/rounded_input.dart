import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:skinsstonks_mobile/constants.dart';

class RoundedInput extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onchange;

  const RoundedInput({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          icon: Icon(icon, color: kPrimaryHeadingColor),
          hintText: hintText,
        ),
      ),
    );
  }
}