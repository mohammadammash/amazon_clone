import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomBarSingleItem({
  required final double bottomBarWidth,
  required final double bottomBarBorder,
  required final int currentPage,
  required final Color mainColor,
  required final Color secondaryColor,
  required final IconData icon,
  required final int index,
  final int? cartLength,
}) {
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
      child: index == 2
          ? Badge(
              elevation: 0,
              badgeContent: Text(cartLength.toString()),
              badgeColor: Colors.yellow,
              child: Icon(icon),
            )
          : Icon(
              icon,
            ),
    ),
    label: '', //should be added!!!
  );
}
