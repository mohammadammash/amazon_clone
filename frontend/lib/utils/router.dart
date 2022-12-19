import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/user/cart/screens/address_screen.dart';
import 'package:amazon_clone/features/user/home/screens/category_details_screen.dart';
import 'package:amazon_clone/features/user/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/user/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import "package:flutter/material.dart";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.authScreen:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

    case RoutesNames.categoryDetailsScreen:
      final category = settings.arguments
          as String; //by def obj but we know we only will pass string to this route
      return MaterialPageRoute(
        builder: (context) => CategoryDetailsScreen(category: category),
      );

    case RoutesNames.searchProductsScreen:
      final searchText = settings.arguments
          as String; //by def obj but we know we only will pass string to this route
      return MaterialPageRoute(
        builder: (context) => SearchProductsScreen(searchText: searchText),
      );

    case RoutesNames.productDetailsScreen:
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      );

    case RoutesNames.addressScreen:
      return MaterialPageRoute(
        builder: (context) => const AddressScreen(),
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
