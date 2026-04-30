import 'package:fruit_hub/features/checkout/domain/shipping_address_entity.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCache;
  final ShippingAddressEntity? shippingAddress;

  OrderEntity(
      {this.payWithCache,
       this.shippingAddress,
      required this.cartEntity});
}
