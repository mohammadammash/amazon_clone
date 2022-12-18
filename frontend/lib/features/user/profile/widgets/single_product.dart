import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;

  const SingleProduct({super.key, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            productImage,
            fit: BoxFit.fill,
            width: 200,
          ),
        ),
      ),
    );
  }
}
