import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/routes/slide_page_route.dart';
import 'package:skinstonks_mobile/screens/login/index.dart';
import 'package:skinstonks_mobile/screens/splash.dart';
import 'package:skinstonks_mobile/screens/signup/index.dart';
import 'package:skinstonks_mobile/screens/wrapper.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return SlidePageRoute(widget: SplashScreen());
    case '/home':
      return SlidePageRoute(widget: Wrapper());
    case '/login':
      return SlidePageRoute(widget: LoginScreen());
    case '/signup':
      return SlidePageRoute(widget: SignupScreen());
    default:
      return SlidePageRoute(widget: SplashScreen());
  }
}
