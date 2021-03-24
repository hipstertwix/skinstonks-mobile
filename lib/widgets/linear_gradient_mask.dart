import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/config/constants.dart';

class LinearGradientMask extends StatelessWidget {
  final Widget child;
  final bool selected;
  LinearGradientMask({required this.child, this.selected = true});

  @override
  Widget build(BuildContext context) {
    return !selected
        ? child
        : ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kLinearGradientLightColor, kLinearGradientDarkColor],
            ).createShader(bounds),
            child: child,
          );
  }
}
