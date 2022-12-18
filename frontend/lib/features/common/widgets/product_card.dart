import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/rating_stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double? ratingAverage;
  const ProductCard({
    super.key,
    required this.product,
    this.ratingAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          child: Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(
                product.images[0],
                fit: (BoxFit.fitHeight),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: GlobalVariables.textSM,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  if (ratingAverage != null)
                    StarsRating(rating: ratingAverage!),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: GlobalVariables.textXL,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Eligible for free shipping',
                    style: TextStyle(
                      fontSize: GlobalVariables.textXS,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'In Stock',
                    style: TextStyle(
                      fontSize: GlobalVariables.textXXS,
                      color: Colors.teal,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
