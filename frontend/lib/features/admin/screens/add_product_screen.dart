import 'dart:io';
import 'package:amazon_clone/constants/data_lists.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/common/widgets/carousel_image.dart';
import 'package:amazon_clone/features/common/widgets/text_input.dart';
import 'package:amazon_clone/utils/images_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                //-----------------------
                //START OF ADD IMAGE INPUT
                images.isNotEmpty
                    ? CarouselImage(data: images)
                    : GestureDetector(
                        onTap: selectProductImages,
                        child: DottedBorder(
                          //external package
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          child: Container(
                            //dotted container
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //dotted container data
                              children: [
                                const Icon(Icons.folder_open, size: 40),
                                const SizedBox(height: 10),
                                Text('Select Product Images',
                                    style: TextStyle(
                                      fontSize: GlobalVariables.textSM,
                                      color: Colors.grey.shade500,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
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
                CustomButton(text: 'Sell', handlePress: () {})
              ],
            ),
          ),
        ));
  }
}
