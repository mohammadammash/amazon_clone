import 'dart:convert';
//to create provider(State management) from this class

class User {
  final String id; //in flutter it cannot be _id => _: means private
  final String name;
  final String password;
  final String address;
  final String type;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '', //_id: since we're using mongoDB _id
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
