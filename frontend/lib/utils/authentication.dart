import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authentication {
  String getAuthToken({
    required BuildContext context,
  }) {
    return Provider.of<UserProvider>(context, listen: false).user.token;
  }

  Map<String, String> getAPIsHeader({
    required BuildContext context,
  }) {
    return {
      //to match express.json() in express server
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': getAuthToken(context: context),
    };
  }
}
