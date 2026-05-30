import 'package:fruit_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/order_entity.dart';
import 'order_prodct_model.dart';

class OrderModel extends OrderEntity {
  final num totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required super.uid,
    required super.date,
    required super.orderNumber,
    required super.shippingAddress,
    required super.cartEntity,
    super.payWithCache,
  });

  factory OrderModel.fromEntity(OrderEntity entity, {required int orderNumber}) {
    return OrderModel(
      orderNumber: orderNumber,
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      uid: entity.uid,
      date:  DateFormat('d MMMM ,yyyy', 'ar').format(DateTime.now()),
      shippingAddressModel: ShippingAddressModel.fromEntity(entity.shippingAddress),
      orderProducts: entity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(e))
          .toList(),
      paymentMethod: entity.payWithCache! ? 'Cache' : 'Online',
      shippingAddress: entity.shippingAddress,
      cartEntity: entity.cartEntity,
      payWithCache: entity.payWithCache,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderNumber: json['orderNumber'],
      totalPrice: json['totalPrice'],
      uid: json['uid'],
      date: json['date'],
      paymentMethod: json['paymentMethod'],
      shippingAddressModel: ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderProducts: (json['orderProducts'] as List)
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      // ✅ مش موجودة في Firestore فبنديها فاضية
      cartEntity: CartEntity([]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderNumber': orderNumber,
      'status': "pending",
      'totalPrice': totalPrice,
      'uid': uid,
      'date': date,
      'paymentMethod': paymentMethod,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    };
  }
}