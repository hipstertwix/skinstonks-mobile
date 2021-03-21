import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/config/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.75,
      decoration: BoxDecoration(color: kPrimaryLightColor, borderRadius: BorderRadius.circular(18)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      child: child,
    );
  }
}
