import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/routes/transitions/fade_route.dart';
import 'package:skinstonks_mobile/screens/home/index.dart';
import 'package:skinstonks_mobile/screens/splash.dart';
import 'package:skinstonks_mobile/screens/welcome/index.dart';
import 'package:skinstonks_mobile/constants/route_paths.dart' as routes;

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return FadeRoute(widget: SplashScreen());
    case routes.HomeRoute:
      return FadeRoute(widget: HomeScreen());
    case routes.LoginRoute:
      return FadeRoute(widget: WelcomeScreen());
    default:
      return FadeRoute(widget: SplashScreen());
  }
}
