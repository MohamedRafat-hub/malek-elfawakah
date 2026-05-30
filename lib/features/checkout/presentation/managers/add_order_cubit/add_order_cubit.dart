import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/repos/add_order_repo.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.addOrderRepo) : super(AddOrderInitial());
  final AddOrderRepo addOrderRepo;

  Future<void> addOrder({required OrderEntity orderEntity}) async {
    emit(AddOrderLoading());
    var result = await addOrderRepo.addOrder(orderEntity: orderEntity);
    result.fold((error) => emit(AddOrderFailure(errorMessage: error.message)),
        (success) => (emit(AddOrderSuccess())));
  }

  Future<void > getOrders({required String userId}) async {
    emit(GetOrdersLoading());
    var result = await addOrderRepo.getOrders(userId: userId);
    result.fold((error) => emit(GetOrdersFailure(errorMessage: error.message)),
        (orders) => (emit(GetOrdersSuccess(orders: orders as List<OrderEntity>))));
  }
}
