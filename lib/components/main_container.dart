import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const MainContainer({Key? key, required this.alignment, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: alignment,
        children: <Widget>[child],
      ),
    );
  }
}
