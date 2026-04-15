import 'dart:io';

import 'package:fruit_hub/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  bool isOrganic;
  final List<ReviewEntity>reviews;

  ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false, required this.reviews,
  });
}