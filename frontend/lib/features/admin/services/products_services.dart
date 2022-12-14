import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/config.dart';
import 'package:http/http.dart' as http;

final authentication = Authentication();

class ProductsServices {
  void addProduct({
    required BuildContext context, //to send showSnackBar to display errors
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      //get my url images storage
      // final cloudinary = CloudinaryPublic(ConstantConfigData.cloudinaryName,
      //     ConstantConfigData.cloudinaryUploadPreset);
      // List<String> imagesUrls = [];

      // for (int i = 0; i < images.length; i++) {
      //   CloudinaryResponse res = await cloudinary.uploadFile(
      //     CloudinaryFile.fromFile(images[i].path, folder: name),
      //   );
      //   imagesUrls.add(res.secureUrl);
      // }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: images,
        category: category,
        price: price,
      );

      debugPrint('-------------');
      debugPrint(product.toJson());
      debugPrint('-------------');

      http.Response response = await http.post(
        Uri.parse(ConstantApiUrls.addProductURL),
        body: product.toJson(),
        headers: authentication.getAPIsHeader(context: context),
      );

      httpResponseHandle(
        response: response,
        context: context,
        onSuccess: (() {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context); //go back to main screen and exit form page
        }),
      );
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getAllProducts(BuildContext context) async {
    List<Product> productList = [];
    try {
      http.Response response = await http.get(
        Uri.parse(ConstantApiUrls.getAllProductsURL),
        headers: authentication.getAPIsHeader(context: context),
      );

      httpResponseHandle(
        response: response,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            final jsonVal = jsonEncode(jsonDecode(response.body)[i]);

            productList.add(Product.fromJson(jsonVal));
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
