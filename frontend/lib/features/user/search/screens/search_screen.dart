import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/features/user/home/widgets/address_box.dart';
import 'package:amazon_clone/features/user/search/services/search_services.dart';
import 'package:amazon_clone/features/common/widgets/product_card.dart';
import 'package:amazon_clone/helpers/calculate_rating_average.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';

class SearchProductsScreen extends StatefulWidget {
  final String searchText;
  const SearchProductsScreen({super.key, required this.searchText});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  Authentication authentication = Authentication();

  List<Product>? productsList = [];
  final SearchServices searchServices = SearchServices();

  void fetchProductsSearchedFor() async {
    productsList = await searchServices.fetchSearchProducts(
        context: context, searchText: widget.searchText);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchProductsSearchedFor();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = authentication.getCurrentUser(context: context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(currentUserType: currentUser.type),
      ),
      body: productsList == null
          ? const CustomLoadingIndicator()
          : Column(
              children: [
                AddressBox(
                  currentUserName: currentUser.name,
                  currentUserAddress: currentUser.address,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: productsList!.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: productsList![index],
                        ratingAverage: calculateRatingAverage(
                          productsList![index].ratings!,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
