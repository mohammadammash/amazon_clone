import 'dart:convert';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:amazon_clone/utils/snackbar.dart';

class ProfileServices {
  //
  Future<List<Order>> getCurrentUserOrders({
    required BuildContext context,
  }) async {
    List<Order> currentUserOrders = [];

    try {
      Authentication authentication = Authentication();

      http.Response response = await http.get(
          Uri.parse(ConstantApiUrls.getCurrentUserOrders),
          headers: authentication.getAPIsHeader(context: context));

      httpResponseHandle(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              currentUserOrders.add(
                Order.fromJson(
                  jsonEncode(
                    jsonDecode(response.body)[i], //decode to access specific id
                  ), //encode it again to as JSON to convert it to Flutter Map
                ), //convert it
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return currentUserOrders;
  }
}
