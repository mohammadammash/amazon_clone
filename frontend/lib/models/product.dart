import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String description;
  final num quantity;
  final List images; //string as urls
  final String category;
  final num price;
  String? id; //optional to add according to response

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
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
      id: map['_id'] ?? '', //_id: since we're using mongoDB _id
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
