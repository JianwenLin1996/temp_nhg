import 'package:flutter/material.dart';
import 'package:nhg_layout/routes/route_list.dart';
import 'package:nhg_layout/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteList.initialScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.initialScreen),
            builder: (_) => const SplashScreen());
      // case RouteList.loginScreen:
      //   return MaterialPageRoute<String>(
      //       settings: const RouteSettings(name: RouteList.loginScreen),
      //       builder: (_) => const LoginScreen());
      case RouteList.loginScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.loginScreen),
            builder: (_) => const LoginScreen());
      case RouteList.resetPasswordScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.resetPasswordScreen),
            builder: (_) => const ResetPasswordScreen());
      case RouteList.homeScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.homeScreen),
            builder: (_) => const HomeScreen());
      case RouteList.errorScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.errorScreen),
            builder: (_) => const ErrorScreen());
      default:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.errorScreen),
            builder: (_) => const ErrorScreen());
    }
  }
}
