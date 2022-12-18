import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/bottom_bar_item.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentPage;
  final Function(int) updatePage;

  const CustomBottomBar({
    super.key,
    required this.currentPage,
    required this.updatePage,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final double _bottomBarWidth = 42;
  final double _bottomBarBorder = 5;

  @override
  Widget build(BuildContext context) {
    //Adding watch context to cart to update badge whenever cart items increase
    final userCartLength = context.watch<UserProvider>().user.cart.length;

    final currentUserType = Provider.of<UserProvider>(context).user.type;
    final icon2 = currentUserType == GlobalVariables.adminUserType
        ? Icons.all_inbox_outlined
        : Icons.person_outline_outlined;
    final icon3 = currentUserType == GlobalVariables.adminUserType
        ? Icons.analytics_outlined
        : Icons.shopping_cart_outlined;

    return BottomNavigationBar(
        currentIndex: widget.currentPage,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: widget.updatePage,
        items: [
          //------------------//
          //HOME:
          customBottomBarSingleItem(
              bottomBarWidth: _bottomBarWidth,
              bottomBarBorder: _bottomBarBorder,
              currentPage: widget.currentPage,
              mainColor: GlobalVariables.selectedNavBarColor,
              secondaryColor: GlobalVariables.unselectedNavBarColor,
              icon: Icons.home_outlined,
              index: 0),
          customBottomBarSingleItem(
              bottomBarWidth: _bottomBarWidth,
              bottomBarBorder: _bottomBarBorder,
              currentPage: widget.currentPage,
              mainColor: GlobalVariables.selectedNavBarColor,
              secondaryColor: GlobalVariables.unselectedNavBarColor,
              icon: icon2,
              index: 1),
          customBottomBarSingleItem(
            bottomBarWidth: _bottomBarWidth,
            bottomBarBorder: _bottomBarBorder,
            currentPage: widget.currentPage,
            mainColor: GlobalVariables.selectedNavBarColor,
            secondaryColor: GlobalVariables.unselectedNavBarColor,
            icon: icon3,
            index: 2,
            cartLength: userCartLength,
          ),
        ]);
  }
}
