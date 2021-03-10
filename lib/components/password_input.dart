import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:skinsstonks_mobile/constants.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;

  const PasswordField(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          icon: Icon(Icons.lock, color: kPrimaryHeadingColor),
          suffixIcon: Icon(Icons.visibility, color: kPrimaryHeadingColor)),
    ));
  }
}
