import '../../../home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final num price;
  final int quantity;
  final String? imageUrl;
  final String name;
  final String code;

  OrderProductModel(
      {required this.price,
        required this.quantity,
        required this.imageUrl,
        required this.name, required this.code});

  Map<String , dynamic >toJson() {
    return{
      'code' : code,
      'price':price,
      'quantity' : quantity,
      'imageUrl' : imageUrl,
      'name' : name,
    };
  }

  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
        code: entity.productEntity.code,
        price: entity.calculateTotalPrice(),
        quantity: entity.quantity,
        imageUrl: entity.productEntity.imageUrl,
        name: entity.productEntity.name);
  }

}