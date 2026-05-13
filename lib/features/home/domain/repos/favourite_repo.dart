import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';

abstract class FavouriteRepo {
  Future<Either<Failure , void>> addToFavourite(String productId);
  Future<Either<Failure , void>> removeFromFavourite(String productId);
  Future<Either<Failure , List<String>>> getFavouriteProductsIds();
}