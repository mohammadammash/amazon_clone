import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:http/http.dart' as http; //to make HTTP requests

class AuthService {
  void signUpUserService({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: "",
          name: name,
          password: password,
          address: "",
          type: "",
          token: "");

    } catch (e) {}
  }
}
