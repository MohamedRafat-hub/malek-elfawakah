import 'package:fruit_hub/features/checkout/domain/shipping_address_entity.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final String uid;
  final CartEntity cartEntity;
  bool? payWithCache;
  ShippingAddressEntity shippingAddress;

  OrderEntity(
      {this.payWithCache,
       required this.shippingAddress,
      required this.cartEntity, required this.uid});
}
