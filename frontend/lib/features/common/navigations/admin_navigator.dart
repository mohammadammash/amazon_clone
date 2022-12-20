import 'package:amazon_clone/features/admin/screens/all_orders_screen.dart';
import 'package:amazon_clone/features/admin/screens/all_products_screen.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminNavigator extends StatefulWidget {
  const AdminNavigator({super.key});

  @override
  State<AdminNavigator> createState() => _AdminNavigatorState();
}

class _AdminNavigatorState extends State<AdminNavigator> {
  int page = 0;

  List<Widget> pages = [
    const AllProductsScreen(),
    const Center(child: Text('Second Page')),
    const OrdersScreen(),
  ];

  void updatePage(int newPageIndex) {
    setState(() {
      page = newPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(currentUserType: currentUser.type),
      ),
      body: pages[page],
      bottomNavigationBar:
          CustomBottomBar(currentPage: page, updatePage: updatePage),
    );
  }
}
