import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.child,
    required this.press,
    this.color = Colors.white,
    this.textColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: textColor,
            backgroundColor: color,
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 40),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: 'Montserrat',
            ),
          ),
          onPressed: () => {press()},
          child: child,
        ),
      ),
    );
  }
}
