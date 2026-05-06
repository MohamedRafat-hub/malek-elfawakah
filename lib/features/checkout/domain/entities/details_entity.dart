import 'order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['shipping'] = this.shipping;
    data['shipping_discount'] = this.shippingDiscount;
    return data;
  }

  factory Details.fromEntity(OrderEntity orderEntity) {
    return Details(
      shipping: "30",
      shippingDiscount: orderEntity.calculateShippingDiscount(),
      subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
    );
  }
}