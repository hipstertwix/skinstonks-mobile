import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget widget;

  SlidePageRoute({required this.widget})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            child: child,
            position: animation.drive(
              Tween(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(
                CurveTween(
                  curve: Curves.ease,
                ),
              ),
            ),
          ),
        );
}
