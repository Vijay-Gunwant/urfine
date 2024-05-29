import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_fine/screens/dashboard.dart';
import 'package:ur_fine/screens/forgot_password.dart';
import 'package:ur_fine/screens/register.dart';
import 'package:ur_fine/screens/splash_screen.dart';
import 'package:ur_fine/services/file_provider.dart';
import 'package:ur_fine/services/user_details_provider.dart';
import '../screens/login.dart';

class RouteGenerator {
  static String login = "/login";
  static String register = "/register";
  static String dashboard = "/dashboard";
  static String resetPassword = "/resetPassword";
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (context) => const Login());
      case "/register":
        return MaterialPageRoute(builder: (context) => const Register());
      case "/dashboard":
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              Provider.of<UserDetailsProvider>(context).setUserUsingUid(settings.arguments.toString());
              return ChangeNotifierProvider<FileProvider>(
                create: (context) => FileProvider(),
                child: const DashBoard(),
              );
            });
      case "/resetPassword":
        return MaterialPageRoute(builder: (context) => const ForgotPassword());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
