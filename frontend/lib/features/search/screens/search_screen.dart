import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchProductsScreen extends StatefulWidget {
  final String searchText;
  const SearchProductsScreen({super.key, required this.searchText});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  List<Product>? productsList = [];a
  final SearchServices searchServices = SearchServices();

  void fetchProductsSearchedFor() async {
    productsList = await searchServices.fetchSearchProducts(
        context: context, searchText: widget.searchText);
    setState(() {});
    debugPrint('-------------------');
    debugPrint(productsList!.length.toString());
    debugPrint('-------------------');
  }

  @override
  void initState() {
    super.initState();
    fetchProductsSearchedFor();
  }

  @override
  Widget build(BuildContext context) {
    if (productsList == null) return const CustomLoadingIndicator();

    return Scaffold(
        body: Center(
      child: Text(widget.searchText),
    ));
  }
}
