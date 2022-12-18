import 'package:flutter/material.dart';

class CartProductQuantityInput extends StatefulWidget {
  final int quantity;
  const CartProductQuantityInput({super.key, required this.quantity});

  @override
  State<CartProductQuantityInput> createState() =>
      _CartProductQuantityInputState();
}

class _CartProductQuantityInputState extends State<CartProductQuantityInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(children: [
                Container(
                  width: 30,
                  height: 30,
                  //Container > SizedBox to use 'Alignment'
                  alignment: Alignment.center,
                  child: const Icon(Icons.remove, size: 18),
                ),
                Container(
                  width: 30,
                  height: 30,
                  //Container > SizedBox to use 'Alignment'
                  alignment: Alignment.center,
                  child: Text(widget.quantity.toString()),
                ),
                Container(
                  width: 30,
                  height: 30,
                  //Container > SizedBox to use 'Alignment'
                  alignment: Alignment.center,
                  child: const Icon(Icons.add, size: 18),
                ),
              ]))
        ],
      ),
    );
  }
}
