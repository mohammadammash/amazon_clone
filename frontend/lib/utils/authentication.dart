import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authentication {
  User getCurrentUser({required BuildContext context}) {
    return Provider.of<UserProvider>(context, listen: false).user;
  }

  void updateUserProviderFromModel({
    required BuildContext context,
    required User user,
  }) {
    Provider.of<UserProvider>(context, listen: false).setUserFromModel(user);
  }

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
