import 'package:fashion_store/components/drawer_component.dart';
import 'package:fashion_store/view/auth/login.dart';
import 'package:fashion_store/view/auth/register.dart';
import 'package:fashion_store/view/home/home.dart';
import 'package:fashion_store/view/splash/splashScreen.dart';
import 'package:flutter/material.dart';

class RouteAPI {
  static const splash = "/";
  static const login = "/login";
  static const register = "/register";
  static const bottom = "/bottom";
  static const home = "/home";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
        case home:
        return MaterialPageRoute(
          builder: (context) => const DrawerComponent(),
        );

      default:
        throw const FormatException("Route not found!");
    }
  }
}
