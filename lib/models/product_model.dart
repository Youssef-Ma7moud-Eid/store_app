import 'package:flutter/material.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final rating? model;
  final String catagory;
  IconData icon = Icons.favorite_border;
  ProductModel({
    required this.description,
    required this.catagory,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.model,
  });
  factory ProductModel.fromjson(json) {
    return ProductModel(
      id: (json["id"]),
      description: json["description"],
      title: json["title"],
      price: json["price"],
      image: json["image"],
      model: json["rating"] != null ? rating.fromJson(json["rating"]) : null,
      catagory: json["category"],
    );
  }
}

class rating {
  final dynamic rate;
  final dynamic count;
  const rating({required this.rate, required this.count});
  factory rating.fromJson(json) {
    return rating(count: json["count"], rate: json["rate"]);
  }
}
