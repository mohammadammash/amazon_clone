import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authentication {
  User getCurrentUser({required BuildContext context}) {
    return Provider.of<UserProvider>(context, listen: false).user;
  }

  void updateUserProviderCartFromModelWithoutRerendering({
    required BuildContext context,
    required cart,
  }) {
    showSnackBar(context, 'Cart Altered Successfully!!');
    //instead of updating whole user and refresh go back to auth page
    //only set cart in user, Generate copyWith in UserModel
    //create setUserFromModel in userProvider to update current user
    final currentUser = getCurrentUser(context: context);
    User newUserData = currentUser.copyWith(cart: cart);

    Provider.of<UserProvider>(context, listen: false)
        .setUserFromModel(newUserData);
  }

  void updateUserProviderAddressFromModelWithoutRerendering({
    required BuildContext context,
    required address,
  }) {
    showSnackBar(context, 'Address updated Successfully!!');
    final currentUser = getCurrentUser(context: context);
    User newUserData = currentUser.copyWith(address: address);

    Provider.of<UserProvider>(context, listen: false)
        .setUserFromModel(newUserData);
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
