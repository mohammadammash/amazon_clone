import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/common/navigations/user_navigator.dart';
import "package:flutter/material.dart";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.authScreen:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

    case RoutesNames.userHomeBottomNavigation:
      return MaterialPageRoute(
        builder: (context) => const UserNavigator(),
      );

    //ADMIN
    case RoutesNames.addProductScreen:
      return MaterialPageRoute(
        builder: (context) => const AddProductScreen(),
      );

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
