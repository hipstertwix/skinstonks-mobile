import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CardBackgroundPainter extends CustomPainter {
  final List<Color>? gradientColors;
  final Animation<Color?>? animationColor1;
  final Animation<Color?>? animationColor2;

  CardBackgroundPainter(
    Animation<double> animation, {
    this.animationColor1,
    this.animationColor2,
    this.gradientColors,
  })  : assert((animationColor1 != null && animationColor2 != null) ||
            (animationColor1 == null && animationColor2 == null && gradientColors != null)),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8408057, size.height * 0.9718670);
    path_0.cubicTo(size.width * 0.6104613, size.height * 1.009378, size.width * 0.3892138,
        size.height * 1.009378, size.width * 0.1588694, size.height * 0.9718670);
    path_0.cubicTo(size.width * 0.09616634, size.height * 0.9573743, size.width * 0.04450942,
        size.height * 0.9102018, size.width * 0.03086420, size.height * 0.8547883);
    path_0.cubicTo(size.width * -0.01039636, size.height * 0.6194942, size.width * -0.01039636,
        size.height * 0.3805058, size.width * 0.03086420, size.height * 0.1452117);
    path_0.cubicTo(size.width * 0.04450942, size.height * 0.09008241, size.width * 0.09616634,
        size.height * 0.04262575, size.width * 0.1588694, size.height * 0.02813299);
    path_0.cubicTo(size.width * 0.3892138, size.height * -0.009377664, size.width * 0.6104613,
        size.height * -0.009377664, size.width * 0.8408057, size.height * 0.02813299);
    path_0.cubicTo(size.width * 0.9035088, size.height * 0.04262575, size.width * 0.9551657,
        size.height * 0.08979824, size.width * 0.9688109, size.height * 0.1452117);
    path_0.cubicTo(size.width * 1.009747, size.height * 0.3802217, size.width * 1.009747,
        size.height * 0.6194942, size.width * 0.9688109, size.height * 0.8545041);
    path_0.cubicTo(size.width * 0.9551657, size.height * 0.9102018, size.width * 0.9035088,
        size.height * 0.9573743, size.width * 0.8408057, size.height * 0.9718670);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;

    paint_0_fill.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(0, size.height),
      gradientColors != null ? gradientColors! : [animationColor1!.value!, animationColor2!.value!],
    );
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
