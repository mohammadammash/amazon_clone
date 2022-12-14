import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authentication {
  
  String getAuthToken({
    required BuildContext context,
  }) {
    return Provider.of<UserProvider>(context, listen: false).user.token;
  }
}
