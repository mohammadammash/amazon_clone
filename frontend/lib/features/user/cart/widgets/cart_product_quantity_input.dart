import 'package:flutter/material.dart';

class CartProductQuantityInput extends StatefulWidget {
  final String productId;
  final int quantity;
  final Function(String) handlePressIncrementQuantity;
  final Function(String) handlePressDecrementQuantity;
  const CartProductQuantityInput({
    super.key,
    required this.productId,
    required this.quantity,
    required this.handlePressDecrementQuantity,
    required this.handlePressIncrementQuantity,
  });

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
                color: Colors.grey.shade400,
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(children: [
                //---------------
                //DECREMENT ICON
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  width: 30,
                  height: 30,
                  //Container > SizedBox to use 'Alignment'
                  alignment: Alignment.center,
                  child: const Icon(Icons.remove, size: 18),
                ),
                //---------------
                //TOTAL QUANTITY
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.white,
                  ),
                  width: 30,
                  height: 30,
                  //Container > SizedBox to use 'Alignment'
                  alignment: Alignment.center,
                  child: Text(
                    widget.quantity.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //---------------
                //INCREMENT ICON
                InkWell(
                  onTap: () =>
                      widget.handlePressIncrementQuantity(widget.productId),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    width: 30,
                    height: 30,
                    //Container > SizedBox to use 'Alignment'
                    alignment: Alignment.center,
                    child: const Icon(Icons.add, size: 18),
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
