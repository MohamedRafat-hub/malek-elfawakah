import 'package:fruit_hub/core/entities/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity{
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }


  void removeCartItem(CartItemEntity cartItemEntity){
    cartItems.remove(cartItemEntity);
  }


  bool isExistInCart(ProductEntity productEntity){
    for(var product in cartItems){
      if(product.productEntity == productEntity){
        return true;
      }
    }
    return false;
  }



  num calculateTotalPrice(){
    num total = 0;
    for(var cartItem in cartItems)
      {
        total += cartItem.calculateTotalPrice();
      }
    return total;
  }
}


