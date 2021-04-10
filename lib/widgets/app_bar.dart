import 'package:flutter/material.dart';

AppBar mainAppBar(String titleText) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    brightness: Brightness.dark,
    title: Text(
      titleText,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
