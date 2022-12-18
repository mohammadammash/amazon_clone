import 'package:amazon_clone/features/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/user/home/screens/home_screen.dart';
import 'package:amazon_clone/features/user/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class UserNavigator extends StatefulWidget {
  const UserNavigator({super.key});

  @override
  State<UserNavigator> createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {
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
