import 'dart:io';
import 'package:fruit_hub/core/models/review_model.dart';

import '../entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final String imageUrl;
  final bool isFeatured;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  bool isOrganic;
  final int sellingCount;
  final File image;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.reviews,
    required this.sellingCount,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: File(json['imageUrl']),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'],
      sellingCount: json['sellingCount'] ?? 0,
      reviews: (json['reviews'] as List<dynamic>)
          .map((reviewJson) => ReviewModel.fromJson(reviewJson))
          .toList(),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      code: code,
      description: description,
      isFeatured: isFeatured,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      imageUrl: imageUrl,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}
