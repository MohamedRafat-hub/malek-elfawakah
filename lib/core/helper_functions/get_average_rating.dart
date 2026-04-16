import '../entities/review_entity.dart';

double getAverageRating(List<ReviewEntity> reviews) {
  num sum =0;
  for(var review in reviews){
    sum += review.rating;
  }
  return sum / reviews.length;
}