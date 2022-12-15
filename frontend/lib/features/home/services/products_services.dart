import 'dart:convert';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/features/admin/services/products_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:flutter/material.dart';

class ProductsServices {
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    List<Product> productList = [];
    try {
      http.Response response = await http.get(
        Uri.parse("${ConstantApiUrls.getProductsByCategoryURL}?category=$category"),
        headers: authentication.getAPIsHeader(context: context),
      );

      httpResponseHandle(
        response: response,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(response.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return productList;
  }
}
