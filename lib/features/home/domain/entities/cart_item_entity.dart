import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;



  CartItemEntity({
    required this.productEntity,
    this.quantity = 0,
  });


  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }


  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }


  void increaseCount() {
    quantity++;
  }


  void decreaseCount() {
    if (quantity > 1) {
      quantity--;
    }
  }

  String getCurrency()
  {
    return 'EG';
  }
  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}