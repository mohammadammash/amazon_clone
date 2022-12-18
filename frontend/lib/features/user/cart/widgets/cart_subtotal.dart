import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CartSubtotal extends StatelessWidget {
  final int sum;
  const CartSubtotal({super.key, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text(
            'Subtotal: ',
            style: TextStyle(
              fontSize: GlobalVariables.textMD,
            ),
          ),
          Text(
            '\$$sum',
            style: const TextStyle(
              fontSize: GlobalVariables.textXL,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
