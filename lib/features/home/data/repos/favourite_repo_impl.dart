import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/home/domain/repos/favourite_repo.dart';

class FavouriteRepoImpl extends FavouriteRepo{
  final DatabaseService databaseService;

  FavouriteRepoImpl(this.databaseService);
  String get favouritePath =>
      '${BackendEndpoint.getUserData}/${FirebaseAuth.instance.currentUser!.uid}/${BackendEndpoint.favourites}';
  @override
  Future<Either<Failure, void>> addToFavourite(String productId)async {
    try {
      await databaseService.addData(path: favouritePath, data: {
        'productId': productId,
      },
      uid: productId);
      return const Right(null);
    }catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavouriteProductsIds()async {
    try {
      final List<Map<String , dynamic >>data = await databaseService.getData(path: favouritePath);
      List<String>favouriteProducts  = data.map((e) => e['productId'] as String).toList();
      return Right(favouriteProducts);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavourite(String productId)async {
    try {
      await databaseService.deleteData(path: favouritePath, documentId: productId);
      return const Right(null);
    }  catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}