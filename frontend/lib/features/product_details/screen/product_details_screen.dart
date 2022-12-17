import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/rating_stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    final currentUser = authentication.getCurrentUser(context: context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(currentUserType: currentUser.type),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.product.id!),
              const StarsRating(rating: 4),
            ],
          ),
        ));
  }
}
