import 'dart:convert';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void httpResponseHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      showSnackBar(
        context,
        jsonDecode(response.body)['msg'],
      ); //message as sent in json from backend ({'msg':...})
      break;

    case 500:
      showSnackBar(
          context,
          jsonDecode(response.body)[
              'error']); //error as sent in json from backend ({'error':...})
      break;

    default:
      showSnackBar(context, "Something went wrong");
      break;
  }
}
