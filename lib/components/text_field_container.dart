import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/constants.dart';

class TextFieldContainer extends StatelessWidget {

  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }
}