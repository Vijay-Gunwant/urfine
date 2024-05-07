import 'package:flutter/material.dart';
import 'package:ur_fine/screens/dashboard.dart';
import 'package:ur_fine/screens/register.dart';
import 'package:ur_fine/screens/splash_screen.dart';
import '../screens/login.dart';

class RouteGenerator {
  static String login = "/login";
  static String register = "/register";
  static String dashboard = "/dashboard";
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (context) => const Login());
      case "/register":
        return MaterialPageRoute(builder: (context) => const Register());
      case "/dashboard":
        return MaterialPageRoute(builder: (context) => const DashBoard());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
