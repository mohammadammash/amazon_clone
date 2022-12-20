import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:amazon_clone/utils/snackbar.dart';

class CommonServices {
  //
  Future<List<Order>> fetchAllOrders({
    required BuildContext context,
    required String url,
  }) async {
    List<Order> orders = [];

    try {
      Authentication authentication = Authentication();

      http.Response response = await http.get(
          Uri.parse(url),
          headers: authentication.getAPIsHeader(context: context));

      httpResponseHandle(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              orders.add(
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

    return orders;
  }
}
