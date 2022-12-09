import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import "package:flutter/material.dart";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.authScreen:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

    case RoutesNames.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    //default (error) if not route name is matched
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Screen Not Found!! 404'),
          ),
        ),
      );
  }
}
