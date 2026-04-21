import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;



  CartItemEntity({
    required this.productEntity,
    this.count = 0,
  });


  num calculateTotalPrice() {
    return productEntity.price * count;
  }


  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }


  void increaseCount() {
    count++;
  }


  void decreaseCount() {
    if (count > 1) {
      count--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}