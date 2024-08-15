import 'package:cloud/Features/home/home_view.dart';
import 'package:cloud/Features/splash/splash_view.dart';
import 'package:flutter/material.dart';

class RouterConstants {
  static const splashView = "splash";
  static const homeView = "home";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.splashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case RouterConstants.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
