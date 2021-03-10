import 'package:flutter/material.dart';
import 'package:skinsstonks_mobile/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const Background({Key? key, required this.alignment, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 4,
              colors: [kBackgroundTopColor, kBackgroundBottomColor])),
      child: Stack(
        alignment: alignment,
        children: <Widget>[child],
      ),
    );
  }
}
