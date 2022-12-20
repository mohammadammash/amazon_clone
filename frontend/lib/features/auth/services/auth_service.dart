import 'dart:convert';
import 'package:amazon_clone/constants/api_urls.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/routes_names.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:amazon_clone/utils/response_handle.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; //to make HTTP requests

class AuthService {
  Authentication authentication = Authentication();
  //SignIn Helper
  void _updateUserProvider({required BuildContext context, required user}) {
    Provider.of<UserProvider>(context, listen: false).setUser(user);
  }

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      //created instance of User model to use toJson() method to send map to server as json
      User user = User(
        id: "",
        name: name,
        email: email,
        password: password,
        address: "",
        type: "",
        token: "",
        cart: [],
      );

      http.Response response = await http.post(
          Uri.parse(ConstantApiUrls.registerURL),
          body: user.toJson(),
          headers: <String, String>{
            //to match express.json() in express server
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpResponseHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response =
          await http.post(Uri.parse(ConstantApiUrls.loginURL),
              body: jsonEncode({
                'email': email,
                'password': password,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpResponseHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
              GlobalVariables.authToken,
              jsonDecode(response.body)['token'],
            );
            _updateUserProvider(context: context, user: response.body);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //function to check when app runs if user token exists to redirect user instantly
  void getUserData(
    BuildContext context,
  ) async {
    try {
      String authToken =
          await authentication.getAuthTokenFromSharedPereferences();

      // ignore: prefer_conditional_assignment
      if (authToken.isEmpty) return;

      http.Response response = await http.get(
        Uri.parse(ConstantApiUrls.getCurrentUserURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': authToken
        },
      );

      //Update provider and addUser returned if token exists and valid
      _updateUserProvider(context: context, user: response.body);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //
  void logoutUser({
    required BuildContext context,
  }) {
    authentication.removeAuthToken();
    //remove until remove all prev stacks so no back allowed
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesNames.authScreen, (route) => false);
  }
}
