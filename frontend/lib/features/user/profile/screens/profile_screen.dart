import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/common/services/common_services.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/features/user/profile/widgets/below_appbar_header.dart';
import 'package:amazon_clone/features/user/profile/widgets/profile_button.dart';
import 'package:amazon_clone/features/user/profile/widgets/single_product.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Authentication authentication = Authentication();
  final AuthService authService = AuthService();
  final CommonServices commonServices = CommonServices();

  void handlePressLogoutUser(BuildContext context) async {
    authService.logoutUser(context: context);
  }

  List<Order>? orders; //intial null to add loading state
  void fetchCurrentUserAllOrders() async {
    orders = await commonServices.fetchAllOrders(
        context: context, url: ConstantApiUrls.getCurrentUserOrders);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchCurrentUserAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = authentication.getCurrentUser(context: context);

    return Scaffold(
      //-------------------
      //APP BAR
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(currentUserType: currentUser.type),
      ),
      body: orders == null
          ? const CustomLoadingIndicator()
          : Column(
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
                        ProfileButton(
                            text: 'Turn to Seller', handlePress: () {}),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ProfileButton(
                            text: 'Log out',
                            handlePress: () => handlePressLogoutUser(context)),
                        ProfileButton(
                            text: 'Your Wishlist', handlePress: () {}),
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
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, right: 0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: orders!.length,
                        itemBuilder: ((context, index) {
                          return SingleProduct(
                              productImage:
                                  orders![index].products[0].images[0]);
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
