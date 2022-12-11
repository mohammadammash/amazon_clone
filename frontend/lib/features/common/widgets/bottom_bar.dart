import 'package:amazon_clone/constants/global_variables.dart';
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
          BottomNavigationBarItem(
            icon: Container(
              width: _bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: widget.currentPage == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: _bottomBarBorder,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '', //should be added!!!
          ),
          //---------------------//
          //ACCOUNT/PROFILE:
          BottomNavigationBarItem(
            icon: Container(
              width: _bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: widget.currentPage == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: _bottomBarBorder,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '', //should be added!!!
          ),
          //---------------------//
          //CART:
          BottomNavigationBarItem(
            icon: Container(
              width: _bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: widget.currentPage == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: _bottomBarBorder,
                  ),
                ),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: const Text('2'),
                badgeColor: Colors.yellow,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '', //should be added!!!
          ),
        ]);
  }
}
