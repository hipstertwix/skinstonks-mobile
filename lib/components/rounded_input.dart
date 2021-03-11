import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:skinsstonks_mobile/constants.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onchange;
  final TextEditingController controller;

  const RoundedInput(
      {Key? key,
      required this.hintText,
      required this.onchange,
      required this.controller})
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
        style: textStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: textStyle,
        ),
      ),
    );
  }
}
