import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants.dart';
import 'text_field_container.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  final TextEditingController controller;

  const PasswordField(
      {Key? key, required this.onChanged, required this.labelText, required this.controller})
      : super(key: key);

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
        onChanged: onChanged,
        obscureText: true,
        style: textStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: labelText,
          labelStyle: textStyle,
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.lock_rounded,
              color: kPrimaryDarkColor,
              size: 22,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
