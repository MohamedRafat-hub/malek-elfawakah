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
    this.isOrganic = false, required this.reviews,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(

      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl ?? '',
      isFeatured: entity.isFeatured,
      expirationMonths: entity.expirationMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      isOrganic: entity.isOrganic, reviews: entity.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
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