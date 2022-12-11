import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomBarSingleItem(
  final double bottomBarWidth,
  final double bottomBarBorder,
  final int currentPage,
  final Color mainColor,
  final Color secondaryColor,
  final IconData icon,
  final int index,
) {
  return BottomNavigationBarItem(
    icon: Container(
      width: bottomBarWidth,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: currentPage == index ? mainColor : secondaryColor,
            width: bottomBarBorder,
          ),
        ),
      ),
      child: Icon(icon),
    ),
    label: '', //should be added!!!
  );
}

//IF INDEX == 2 Add bage instead of icon in line 24
// child: Badge(
//                 elevation: 0,
//                 badgeContent: const Text('2'),
//                 badgeColor: Colors.yellow,
//                 child: const Icon(Icons.shopping_cart_outlined),
//               ),