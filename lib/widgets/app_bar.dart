import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

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
