import 'package:fruit_hub/features/checkout/data/models/shipping_address_model.dart';
import '../../domain/order_entity.dart';
import 'order_prodct_model.dart';

class OrderModel {
  final num totalPrice;
  final String uid;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
        required this.uid,
        required this.shippingAddressModel,
        required this.orderProducts,
        required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
        totalPrice: entity.cartEntity.calculateTotalPrice(),
        uid: entity.uid,
        shippingAddressModel:
        ShippingAddressModel.fromEntity(entity.shippingAddress),
        orderProducts: entity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromEntity(e))
            .toList(),
        paymentMethod: entity.payWithCache! ? 'Cache' : 'Online');
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPrice': totalPrice,
      'uid': uid,
      'paymentMethod': paymentMethod,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    };
  }
}