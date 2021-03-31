import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final Function press;
  final Color color, textColor;
  final Gradient? gradient;
  final double fontSize;

  const RoundedButton({
    Key? key,
    required this.child,
    required this.press,
    this.color = Colors.white,
    this.textColor = kPrimaryColor,
    this.fontSize = 17,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        gradient: gradient ?? null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: textColor,
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 40),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            fontFamily: 'Montserrat',
          ),
        ),
        onPressed: () => {press()},
        child: child,
      ),
    );
  }
}
