import 'package:amazon_clone/features/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int page = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const Center(child: Text('Cart Page')),
  ];

  void updatePage(int newPageIndex) {
    debugPrint('$newPageIndex');
    setState(() {
      page = newPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar:
          CustomBottomBar(currentPage: page, updatePage: updatePage),
    );
  }
}
