import 'package:flutter/material.dart';

class CardBackgroundPainter extends CustomPainter {
  final Color? color;
  final Animation<Color?>? animationColor;

  CardBackgroundPainter(
    Animation<double> animation, {
    this.animationColor,
    this.color,
  })  : assert((animationColor != null) || (animationColor == null && color != null)),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.8408057, size.height * 0.9718670);
    path.cubicTo(size.width * 0.6104613, size.height * 1.009378, size.width * 0.3892138,
        size.height * 1.009378, size.width * 0.1588694, size.height * 0.9718670);
    path.cubicTo(size.width * 0.09616634, size.height * 0.9573743, size.width * 0.04450942,
        size.height * 0.9102018, size.width * 0.03086420, size.height * 0.8547883);
    path.cubicTo(size.width * -0.01039636, size.height * 0.6194942, size.width * -0.01039636,
        size.height * 0.3805058, size.width * 0.03086420, size.height * 0.1452117);
    path.cubicTo(size.width * 0.04450942, size.height * 0.09008241, size.width * 0.09616634,
        size.height * 0.04262575, size.width * 0.1588694, size.height * 0.02813299);
    path.cubicTo(size.width * 0.3892138, size.height * -0.009377664, size.width * 0.6104613,
        size.height * -0.009377664, size.width * 0.8408057, size.height * 0.02813299);
    path.cubicTo(size.width * 0.9035088, size.height * 0.04262575, size.width * 0.9551657,
        size.height * 0.08979824, size.width * 0.9688109, size.height * 0.1452117);
    path.cubicTo(size.width * 1.009747, size.height * 0.3802217, size.width * 1.009747,
        size.height * 0.6194942, size.width * 0.9688109, size.height * 0.8545041);
    path.cubicTo(size.width * 0.9551657, size.height * 0.9102018, size.width * 0.9035088,
        size.height * 0.9573743, size.width * 0.8408057, size.height * 0.9718670);
    path.close();

    Paint paintFill = Paint()..color = color != null ? color! : animationColor!.value!;
    // paintFill.shader = ui.Gradient.linear(
    //   Offset(0, 0),
    //   Offset(0, size.height),
    //   gradientColors != null ? gradientColors! : [animationColor1!.value!, animationColor2!.value!],
    // );
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
