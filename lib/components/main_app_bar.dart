import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String? titleText;

  const MainAppBar({Key? key, this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        (titleText ?? ""),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
