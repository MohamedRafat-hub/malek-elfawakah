import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

abstract class AddOrderRepo {
  Future<Either<Failure , void>>addOrder({required OrderEntity orderEntity });
  Future<Either<Failure , List<OrderModel>>> getOrders({required String userId});
}