import 'package:flutter/material.dart';
import 'package:nhg_layout/routes/route_list.dart';
import 'package:nhg_layout/screens/add_new_item_screen/view.dart';
import 'package:nhg_layout/screens/change_password_screen.dart/view.dart';
import 'package:nhg_layout/screens/history_screen/view.dart';
import 'package:nhg_layout/screens/new_location_screen/view.dart';
import 'package:nhg_layout/screens/notification_screen/view.dart';
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
      case RouteList.notificationScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.notificationScreen),
            builder: (_) => const NotificationScreen());
      case RouteList.historyScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.historyScreen),
            builder: (_) => const HistoryScreen());
      case RouteList.addNewItemScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.addNewItemScreen),
            builder: (_) => const AddNewItemScreen());
      case RouteList.newLocationScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.newLocationScreen),
            builder: (_) => const NewLocationScreen());
      case RouteList.changePasswordScreen:
        return MaterialPageRoute<String>(
            settings: const RouteSettings(name: RouteList.changePasswordScreen),
            builder: (_) => const ChangePasswordScreen());
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
