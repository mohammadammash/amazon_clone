import 'package:flutter/material.dart';

class SearchProductsScreen extends StatefulWidget {
  final String searchText;
  const SearchProductsScreen({super.key, required this.searchText});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(widget.searchText),
    ));
  }
}
