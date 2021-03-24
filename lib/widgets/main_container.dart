import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/config/constants.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const MainContainer({Key? key, this.alignment = Alignment.center, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.only(
            top: statusBarHeight + kTopPadding, left: kSidePadding, right: kSidePadding),
        child: Stack(
          alignment: alignment,
          children: <Widget>[child],
        ),
      ),
    );
  }
}
