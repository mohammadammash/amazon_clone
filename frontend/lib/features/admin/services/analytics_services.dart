import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:amazon_clone/features/admin/models/sales.dart';

class AnalyticsServices {
  //
  Future<Map<String, dynamic>> fetchCategoriesAnalytics({
    required BuildContext context,
  }) async {
    List<Sales> sales = [];
    num totalEarnings = 0;

    try {
      Authentication authentication = Authentication();

      http.Response response = await http.get(
          Uri.parse(ConstantApiUrls.getAnalytics),
          headers: authentication.getAPIsHeader(context: context));

      httpResponseHandle(
          response: response,
          context: context,
          onSuccess: () {
            final data = jsonDecode(response.body);
            sales = [
              Sales('Mobiles', data['mobileEarnings']),
              Sales('Essentials', data['essentialEarnings']),
              Sales('Books', data['applianceEarnings']),
              Sales('Appliances', data['bookEarnings']),
              Sales('Fashion', data['fashionEarnings']),
            ];
            data.forEach((key, value) => totalEarnings += value);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return {
      'sales': sales,
      'totalEarnings': totalEarnings,
    };
  }
}
