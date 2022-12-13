import 'dart:io';
import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/config.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
    final String authToken =
        Provider.of<UserProvider>(context, listen: false).user.token;

    try {
      //get my url images storage
      final cloudinary = CloudinaryPublic(ConstantConfigData.cloudinaryName,
          ConstantConfigData.cloudinaryUploadPreset);
      List<String> imagesUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imagesUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imagesUrls,
        category: category,
        price: price,
      );

      http.Response response = await http.post(
          Uri.parse(ConstantApiUrls.addProductURL),
          body: product.toJson(),
          headers: <String, String>{
            //to match express.json() in express server
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': authToken,
          });

      httpResponseHandle(
        response: response,
        context: context,
        onSuccess: (() {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context); //go back to main screen and exit form page
        }),
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
