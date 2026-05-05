import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/features/checkout/domain/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/repos/add_order_repo.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.addOrderRepo) : super(AddOrderInitial());
  final AddOrderRepo addOrderRepo;

  addOrder({required OrderEntity orderEntity}) async {
    emit(AddOrderLoading());
    var result = await addOrderRepo.addOrder(orderEntity: orderEntity);
    result.fold((error) => emit(AddOrderFailure(errorMessage: error.message)),
        (success) => (emit(AddOrderSuccess())));
  }
}
