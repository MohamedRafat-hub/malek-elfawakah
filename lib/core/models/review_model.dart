import '../entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String reviewDescription;
  final num rating;
  final String image;
  final DateTime date;


  ReviewModel({
    required this.name,
    required this.reviewDescription,
    required this.rating,
    required this.image,
    required this.date,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity){
    return ReviewModel(
      name: entity.name,
      reviewDescription: entity.reviewDescription,
      rating: entity.rating,
      image: entity.image,
      date: entity.date,
    );
  }


  factory ReviewModel.fromJson(Map<String , dynamic> json){
    return ReviewModel(
      name: json['name'],
      reviewDescription: json['reviewDescription'],
      rating: json['rating'],
      image: json['image'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'name': name,
      'reviewDescription': reviewDescription,
      'rating': rating,
      'image': image,
      'date': date.toIso8601String(),
    };
  }

}