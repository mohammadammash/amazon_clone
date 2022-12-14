import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/features/admin/services/products_services.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/features/profile/widgets/single_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List<Product>? products; //state to hold all products
  final ProductsServices productServices = ProductsServices();
  void fetchAllProducts() async {
    List<Product> result = await productServices.getAllProducts(context);
    setState(() {
      products = result;
    });
  }

  @override
  void initState() {
    //onload similar to useEffect
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    void navigateToPage(String routeName) {
      Navigator.pushNamed(context, routeName);
    }

    //null same as intial state means loading only
    if (products == null) return const CustomLoadingIndicator();

    return Scaffold(
      body:
          //-------------------
          //START OF ALL ITEMS GRID
          GridView.builder(
        itemCount: products!.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final productData = products![index];
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                  child: SingleProduct(productImage: productData.images[0]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          productData.name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      //END OF ALL ITEMS GRID
      //-------------------

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToPage(RoutesNames.addProductScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
