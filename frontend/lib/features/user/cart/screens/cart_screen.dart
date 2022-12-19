import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/features/user/cart/services/cart_services.dart';
import 'package:amazon_clone/features/user/product_details/services/products_details_services.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/common/widgets/product_card.dart';
import 'package:amazon_clone/features/user/cart/widgets/cart_product_quantity_input.dart';
import 'package:amazon_clone/features/user/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/user/home/widgets/address_box.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ProductDetailsServices productsDetailsServices =
      ProductDetailsServices();
  final CartServices cartServices = CartServices();
  final Authentication authentication = Authentication();
  int sum = 0;

  void calculateTotalSum(User user) {
    sum = 0;
    user.cart
        .map(
            (item) => sum += item['quantity'] * item['product']['price'] as int)
        .toList();
  }

  void handlePressSubmitOrder(int sum) {
    Navigator.pushNamed(
      context,
      RoutesNames.addressScreen,
      arguments: sum.toString(),
    );
  }

  void handlePressIncrementQuantity(String productId) {
    productsDetailsServices.postAddToCart(
      context: context,
      productId: productId,
    );
  }

  void handlePressDecrementQuantity(String productId) {
    cartServices.deleteProductFromCart(context: context, productId: productId);
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
                  handlePress: () => handlePressSubmitOrder(sum)),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const SizedBox(height: 20),
            //-------------------------
            //ITEMS LIST
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentUser.cart.length,
              itemBuilder: ((nestedContext, index) {
                final productCart =
                    context.watch<UserProvider>().user.cart[index];
                //turn cart in user to map from json using Product
                final product = Product.fromMap(productCart['product']);
                final quantity = productCart['quantity'];

                if (quantity <= 0) return Container();

                return Column(
                  children: [
                    ProductCard(product: product),
                    CartProductQuantityInput(
                      productId: product.id!,
                      quantity: quantity,
                      handlePressDecrementQuantity:
                          handlePressDecrementQuantity,
                      handlePressIncrementQuantity:
                          handlePressIncrementQuantity,
                    ),
                    const Divider(thickness: 0.5, color: Colors.black)
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
