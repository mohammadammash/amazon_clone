import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/common/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void handleSearchSubmit(String searchText) {
    Navigator.pushNamed(context, RoutesNames.searchProductsScreen,
        arguments: searchText);
  }

  @override
  Widget build(BuildContext context) {
    //Handle Navigate to specific category on click
    void handleOnPressCategory(String title) {
      Navigator.pushNamed(context, RoutesNames.categoryDetailsScreen,
          arguments: title);
    }

    Authentication authentication = Authentication();
    final currentUser = authentication.getCurrentUser(context: context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            currentUserType: currentUser.type,
            handleSearchSubmit: handleSearchSubmit),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(
                currentUserName: currentUser.name,
                currentUserAddress: currentUser.address),
            const SizedBox(height: 10),
            TopCategories(handleOnPressCategory: handleOnPressCategory),
            const SizedBox(height: 10),
            const CarouselImage(),
            const DealOfDay(),
          ],
        ),
      ),
    );
  }
}
