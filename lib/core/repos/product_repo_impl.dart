import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/product_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      List<Map<String, dynamic>> data =
          await databaseService.getData(path: BackendEndpoint.products , query: {
            'limit' : 10 ,
            'orderBy' : 'sellingCount',
            'descending' : true
          });
      List<ProductModel> productsList =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products =
          productsList.map((e) => e.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('error message is $e');
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      List<Map<String, dynamic>> data =
      await databaseService.getData(path: BackendEndpoint.products);
      List<ProductModel> productsList =
      data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products =
      productsList.map((e) => e.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('error message is $e');
      return left(ServerFailure('Failed to get products'));
    }
  }
}
