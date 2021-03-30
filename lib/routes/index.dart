import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/routes/slide_page_route.dart';
import 'package:skinstonks_mobile/screens/home/index.dart';
import 'package:skinstonks_mobile/screens/splash.dart';
import 'package:skinstonks_mobile/screens/welcome/index.dart';
import 'package:skinstonks_mobile/constants/route_paths.dart' as routes;

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return SlidePageRoute(widget: SplashScreen());
    case routes.HomeRoute:
      return SlidePageRoute(widget: HomeScreen());
    case routes.LoginRoute:
      return SlidePageRoute(widget: WelcomeScreen());
    default:
      return SlidePageRoute(widget: SplashScreen());
  }
}
