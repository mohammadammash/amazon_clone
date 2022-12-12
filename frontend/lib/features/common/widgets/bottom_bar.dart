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
              _bottomBarWidth,
              _bottomBarBorder,
              widget.currentPage,
              GlobalVariables.selectedNavBarColor,
              GlobalVariables.unselectedNavBarColor,
              Icons.home_outlined,
              0),
          customBottomBarSingleItem(
              _bottomBarWidth,
              _bottomBarBorder,
              widget.currentPage,
              GlobalVariables.selectedNavBarColor,
              GlobalVariables.unselectedNavBarColor,
              icon2,
              1),
          customBottomBarSingleItem(
              _bottomBarWidth,
              _bottomBarBorder,
              widget.currentPage,
              GlobalVariables.selectedNavBarColor,
              GlobalVariables.unselectedNavBarColor,
              icon3,
              2),
        ]);
  }
}
