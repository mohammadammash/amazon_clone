import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/common/widgets/product_card.dart';
import 'package:amazon_clone/features/user/cart/widgets/cart_product_quantity_input.dart';
import 'package:amazon_clone/features/user/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/user/home/widgets/address_box.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Authentication authentication = Authentication();
  int sum = 0;

  void calculateTotalSum(User user) {
    sum = 0;
    user.cart
        .map(
            (item) => sum += item['quantity'] * item['product']['price'] as int)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = authentication.getCurrentUser(context: context);
    calculateTotalSum(currentUser);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          currentUserType: currentUser.type,
          title: 'My Cart',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(
              currentUserName: currentUser.name,
              currentUserAddress: currentUser.address,
            ),
            CartSubtotal(sum: sum),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: CustomButton(
                  text: 'Proceed to Buy ${currentUser.cart.length} items',
                  handlePress: () {}),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 2,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentUser.cart.length,
              itemBuilder: ((context, index) {
                final productCart = currentUser.cart[index];
                //turn cart in user to map from json using Product
                final product = Product.fromMap(productCart['product']);

                return Column(
                  children: [
                    ProductCard(product: product),
                    CartProductQuantityInput(quantity: productCart['quantity']),
                    const SizedBox(height: 10),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
