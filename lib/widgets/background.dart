import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const Background({Key? key, this.alignment = Alignment.center, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: child,
    );
  }
}
