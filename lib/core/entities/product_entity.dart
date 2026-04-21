import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/review_entity.dart';

class ProductEntity extends Equatable {
  final String name;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
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

    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false, required this.reviews,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}