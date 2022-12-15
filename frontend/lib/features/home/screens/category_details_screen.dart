import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/features/home/services/products_services.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String category;
  const CategoryDetailsScreen({super.key, required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  List<Product>? productsList;
  ProductsServices productsServices = ProductsServices();

  void fetchCategoryProducts() async {
    productsList = await productsServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    ); //Update state
    setState(() {}); //inform widget to rebuild
  }

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    final currentUser = authentication.getCurrentUser(context: context);

    if (productsList == null) return const CustomLoadingIndicator();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              currentUserType: currentUser.type, title: widget.category),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.topLeft,
              child: Text('Keep shopping for ${widget.category}',
                  style: const TextStyle(fontSize: GlobalVariables.textLG)),
            ),
            SizedBox(
              height: 170,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                itemCount: productsList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10,
                ), //1 item at each row
                itemBuilder: (context, index) {
                  final shownProduct = productsList![index];

                  return Column(
                    children: [
                      //IMAGE BOX
                      SizedBox(
                        height: 130,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(
                              shownProduct.images[0],
                            ),
                          ),
                        ),
                      ),
                      //TEXT BOX
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 5,
                          right: 15,
                        ),
                        child: Text(
                          shownProduct.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }
}
