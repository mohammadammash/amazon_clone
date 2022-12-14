import 'dart:io';
import 'package:amazon_clone/constants/data_lists.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/services/products_services.dart';
import 'package:amazon_clone/features/admin/widgets/add_product_images_input.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/common/widgets/carousel_image.dart';
import 'package:amazon_clone/features/common/widgets/text_input.dart';
import 'package:amazon_clone/utils/images_picker.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  //internal instances
  final ProductsServices productsServices = ProductsServices();

  final _addProductFormKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  String dropdownSelectedCategory = 'Mobiles';
  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  void selectProductImages() async {
    //async since function is Future(promise)
    final result = await pickImages();
    setState(() {
      images = result;
    });
  }

  void handleSubmitAddProduct() async {
    if (_addProductFormKey.currentState!.validate()) {
      productsServices.addProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: dropdownSelectedCategory,
          images: images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
              currentUserType: GlobalVariables.adminUserType,
              title: 'Add Product'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  //-----------------------
                  //START OF ADD IMAGE INPUT
                  images.isNotEmpty
                      ? CarouselImage(data: images)
                      : AddProductImagesInput(
                          selectProductImages: selectProductImages),
                  //END OF ADD IMAGE INPUT
                  //------------------------

                  //------------------------
                  //START OF INPUTS
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: productNameController,
                      textPlaceholder: 'Product Name'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: descriptionController,
                    textPlaceholder: 'Description',
                    maxLines: 7,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: priceController, textPlaceholder: 'Price'),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: quantityController,
                      textPlaceholder: 'Quantity'),
                  const SizedBox(height: 10),
                  SizedBox(
                    width:
                        double.infinity, //dropdown expands to match word length
                    child: DropdownButton(
                      value: dropdownSelectedCategory,
                      items: ConstantDataLists.addProductsDropdownOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownSelectedCategory = value!;
                        });
                      },
                    ),
                  ),
                  //END OF INPUTS
                  //------------------------

                  const SizedBox(height: 10),
                  CustomButton(
                      text: 'Sell', handlePress: handleSubmitAddProduct)
                ],
              ),
            ),
          ),
        ));
  }
}
