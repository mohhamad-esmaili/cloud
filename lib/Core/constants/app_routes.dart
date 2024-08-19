import 'package:flutter/material.dart';
import 'package:cloud/Features/home/home_view.dart';
import 'package:cloud/Features/splash/splash_view.dart';

// this class let you manage each route name
class RouterConstants {
  static const splashView = "splash";
  static const homeView = "home";
}

// here is app router where we can manage routes in app
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouterConstants.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());

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
