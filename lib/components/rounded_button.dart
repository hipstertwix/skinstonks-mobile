import 'package:flutter/material.dart';
import '../constants.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width *0.7,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 40)
                ),
                backgroundColor: MaterialStateProperty.all(
                    color
                ),
              ),
              onPressed: () => {
                press()
              },
              child: Text(
                text,
                style: TextStyle(
                    color: textColor
                ),
              )
          )
        )
    );
  }
}