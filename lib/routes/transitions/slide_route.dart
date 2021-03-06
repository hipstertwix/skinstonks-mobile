import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  SlideRoute({required this.exitPage, required this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-0.2, 0.0),
                )
                    .chain(
                      CurveTween(
                        curve: Curves.ease,
                      ),
                    )
                    .animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                )
                    .chain(
                      CurveTween(
                        curve: Curves.ease,
                      ),
                    )
                    .animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
