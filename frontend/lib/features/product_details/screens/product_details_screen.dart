import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/common/widgets/carousel_image.dart';
import 'package:amazon_clone/features/common/widgets/rating_stars.dart';
import 'package:amazon_clone/features/product_details/services/products_details_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  //Start of Calculate Reviews Averages On Product Page Load
  double averageRating = 0;
  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.ratings!.length; i++) {
      totalRating += widget.product.ratings![i].rating;
    }

    if (totalRating != 0) {
      averageRating = totalRating / widget.product.ratings!.length.toDouble();
    }
  }
  //End of Calculate Reviews Averages On Product Page Load

  void handleAddProductRating({required double rating}) {
    productDetailsServices.postRateProduct(
      context: context,
      productId: widget.product.id!,
      rating: rating,
    );
  }

  void handleBuyNowButtonPress() {
    debugPrint('BUY NOWWWWW!!');
  }

  void handleAddToCartButtonPress() {
    debugPrint('ADD TOO CARTTT');
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: GlobalVariables.textMD,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CarouselImage(data: widget.product.images),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Deal Price: ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: GlobalVariables.textSM,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '\$${widget.product.price}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: GlobalVariables.textMD,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                StarsRating(rating: averageRating),
              ],
            ),
            const SizedBox(height: 20),
            Text(widget.product.description),
            const SizedBox(height: 20),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const SizedBox(height: 20),
            CustomButton(text: 'Buy Now', handlePress: handleBuyNowButtonPress),
            const SizedBox(height: 10),
            CustomButton(
                text: 'Add To Cart',
                handlePress: handleAddToCartButtonPress,
                colorType: 'secondary'),
            const SizedBox(height: 10),
            const Text(
              'Rate The Product',
              style: TextStyle(
                fontSize: GlobalVariables.textLG,
                fontWeight: FontWeight.bold,
              ),
            ),
            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: GlobalVariables.secondaryColor,
              ),
              onRatingUpdate: (rating) {
                handleAddProductRating(rating: rating);
              },
            )
          ],
        ),
      ),
    );
  }
}
