import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/features/common/services/common_services.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/features/user/profile/widgets/single_product.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final CommonServices commonServices = CommonServices();

  List<Order>? orders;
  void fetchAllOrders() async {
    orders = await commonServices.fetchAllOrders(
        context: context, url: ConstantApiUrls.getAllOrdersURL);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const CustomLoadingIndicator()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              final shownOrder = orders![index];

              return Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 140,
                    child: SingleProduct(
                        productImage: shownOrder.products[0].images[0]),
                  ),
                  Text((DateTime.fromMillisecondsSinceEpoch(
                          shownOrder.orderedAt))
                      .toString()),
                ],
              );
            });
  }
}
