import 'package:dartz/dartz.dart';

import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model.dart';

import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

import '../../domain/repos/add_order_repo.dart';

class AddOrderRepoImpl implements AddOrderRepo {
  final DatabaseService databaseService;

  AddOrderRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity})async {
    try {
      final orderNumber = await databaseService.getNextOrderNumber(path: BackendEndpoint.counters, doc: BackendEndpoint.orders);
      databaseService.addData(
          path: BackendEndpoint.orders,
          data: OrderModel.fromEntity(orderEntity , orderNumber: orderNumber).toJson());
      return right(null);
    }catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders({required String userId})async {
    try {
          final data = await databaseService.getData(
            path: BackendEndpoint.orders,
            query: {
              'where': {'field': 'uid', 'value': userId},
              'orderBy': 'orderNumber',
              'descending': true,
            },
          )as List;

          final orders = data
              .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList();

          return right(orders);
        } catch (e) {
          return left(ServerFailure(e.toString()));
        }
  }
}
