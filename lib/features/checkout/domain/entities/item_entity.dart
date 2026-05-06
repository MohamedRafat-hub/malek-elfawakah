import '../../../home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }

  factory ItemEntity.fromEntity(CartItemEntity entity) {
    return ItemEntity(
      name: entity.productEntity.name,
      price: entity.productEntity.price.toString(),
      quantity: entity.quantity,
      currency: entity.getCurrency(),
    );
  }
}