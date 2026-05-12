import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/storage_service.dart';
import 'package:fruit_hub/features/auth/domain/repos/image_repo.dart';

class ImageRepoImpl implements ImageRepo{
  final StorageService storageService;

  ImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure , String>> uploadImage(String path, String fileName)async {
    try {
      final imageUrl =await storageService.uploadImage(path, fileName);
      return right(imageUrl);
    } catch (e) {
      return left(ServerFailure('Failed to upload image: ${e.toString()}'));
    }
  }
}