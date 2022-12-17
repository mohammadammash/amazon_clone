import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          child: Row(children: [
            Image.network(
              product.images[0],
              fit: (BoxFit.fitHeight),
            ),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ))
              ],
            )
          ]),
        ),
      ],
    );
  }
}
