import 'package:flutter/material.dart';

AppBar getSkinStonksAppBar(String titleText) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      titleText,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
