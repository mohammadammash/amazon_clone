import 'dart:convert';
import 'package:amazon_clone/models/rating.dart';

class Product {
  final String name;
  final String description;
  final num quantity;
  final List images; //string as urls
  final String category;
  final num price;
  final List<Rating>? ratings;
  final String? id; //optional to add according to response

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.ratings,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final p = {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'ratings': ratings,
    };

    return p;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity'] ?? '',
        images: map['images'] ?? '',
        category: map['category'] ?? '',
        price: map['price'] ?? '',
        id: map['_id'] ?? '',
        ratings: map['ratings'] != null
            ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
            : null);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
