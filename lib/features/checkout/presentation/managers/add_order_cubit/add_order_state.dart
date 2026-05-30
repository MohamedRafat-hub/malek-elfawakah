part of 'add_order_cubit.dart';

@immutable
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}
final class AddOrderLoading extends AddOrderState {}
final class AddOrderSuccess extends AddOrderState {}
final class AddOrderFailure extends AddOrderState {
  final String errorMessage;

  AddOrderFailure({required this.errorMessage});
}



final class GetOrdersInitial extends AddOrderState {}
final class GetOrdersLoading extends AddOrderState {}
final class GetOrdersSuccess extends AddOrderState {
  final List<OrderEntity> orders;

  GetOrdersSuccess({required this.orders});
}
final class GetOrdersFailure extends AddOrderState {
  final String errorMessage;

  GetOrdersFailure({required this.errorMessage});
}