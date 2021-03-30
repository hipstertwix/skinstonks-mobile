import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const Background({Key? key, required this.alignment, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kLinearGradientLightColor, kLinearGradientDarkColor],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        alignment: alignment,
        children: <Widget>[child],
      ),
    );
  }
}
