import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/bottom_bar_item.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentPage;
  final Function(int) updatePage;

  const CustomBottomBar(
      {super.key, required this.currentPage, required this.updatePage});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final double _bottomBarWidth = 42;
  final double _bottomBarBorder = 5;

  @override
  Widget build(BuildContext context) {
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
              Icons.person_outline_outlined,
              1),
          customBottomBarSingleItem(
              _bottomBarWidth,
              _bottomBarBorder,
              widget.currentPage,
              GlobalVariables.selectedNavBarColor,
              GlobalVariables.unselectedNavBarColor,
              Icons.shopping_cart_outlined,
              2),
        ]);
  }
}
