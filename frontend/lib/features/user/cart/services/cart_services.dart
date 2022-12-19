import 'dart:convert';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';

class CartServices {
  void deleteProductFromCart({
    required BuildContext context,
    required String productId,
  }) async {
    try {
      Authentication authentication = Authentication();

      http.Response response = await http.delete(
          Uri.parse(ConstantApiUrls.deleteFromCart),
          body: jsonEncode({'product_id': productId}),
          headers: authentication.getAPIsHeader(context: context));

      httpResponseHandle(
          response: response,
          context: context,
          onSuccess: () async {
            authentication.updateUserProviderCartFromModelWithoutRerendering(
              context: context,
              cart: jsonDecode(response.body)['cart'],
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
