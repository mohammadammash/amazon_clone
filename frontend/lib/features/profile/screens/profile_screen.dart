import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/profile/widgets/below_appbar_header.dart';
import 'package:amazon_clone/features/profile/widgets/profile_button.dart';
import 'package:amazon_clone/features/profile/widgets/single_product.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //temporary orders list
  List orders_data = [
    'https://images.unsplash.com/photo-1556656793-08538906a9f8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBob25lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1505156868547-9b49f4df4e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aXBob25lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1537589376225-5405c60a5bd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGlwaG9uZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
  ];

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
          //Titles
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
              ),
              //Display Orders
              Container(
                height: 170,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders_data.length,
                  itemBuilder: ((context, index) {
                    return SingleProduct(productImage: orders_data[index]);
                  }),
                ),
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
