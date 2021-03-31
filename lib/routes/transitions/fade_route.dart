import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget widget;
  FadeRoute({required this.widget})
      : super(
          transitionDuration: Duration(milliseconds: 450),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
