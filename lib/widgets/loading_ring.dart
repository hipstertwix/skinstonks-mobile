import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class LoadingRing extends StatelessWidget {
  final Color color;
  final double size, lineWidth;

  LoadingRing({this.color = kPrimaryColor, this.size = 18, this.lineWidth = 3});

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      size: size,
      lineWidth: lineWidth,
    );
  }
}
