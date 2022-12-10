import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/profile/widgets/below_appbar_header.dart';
import 'package:amazon_clone/features/profile/widgets/profile_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------
      //APP BAR
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'lib/assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const BelowAppBarHeader(),
          const SizedBox(height: 10),
          //-------------------------
          //START OF TOP BUTTONS
          Column(
            children: [
              Row(
                children: [
                  ProfileButton(text: 'Your orders', handlePress: () {}),
                  ProfileButton(text: 'Turn to Seller', handlePress: () {}),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ProfileButton(text: 'Log out', handlePress: () {}),
                  ProfileButton(text: 'Your Wishlist', handlePress: () {}),
                ],
              )
            ],
          ),
          //END OF TOP BUTTONS
          //-------------------------
          const SizedBox(height: 20),
          //----------------------------
          //START OF YOUR ORDERS SECTION
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: GlobalVariables.textMD,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                        fontSize: GlobalVariables.textMD,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
          //END OF YOUR ORDERS SECTION
          //----------------------------
        ],
      ),
    );
  }
}
