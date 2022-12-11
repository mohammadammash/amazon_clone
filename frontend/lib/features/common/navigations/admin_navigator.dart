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
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(currentUserType: currentUser.type),
      ),
      bottomNavigationBar: CustomBottomBar(currentPage: currentPage, updatePage: updatePage),
    );
  }
}
