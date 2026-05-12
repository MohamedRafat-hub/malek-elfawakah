import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';

abstract class ImageRepo {
  Future<Either<Failure , String>> uploadImage(String path, String fileName);
}