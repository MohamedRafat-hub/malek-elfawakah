import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'amount_entity.dart';
import 'item_list_entity.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    data['description'] = this.description;
    if (this.itemList != null) {
      data['item_list'] = this.itemList!.toJson();
    }
    return data;
  }

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: "Paypal Payment Entity",
      itemList: ItemList.fromEntity(items: entity.cartEntity.cartItems),
    );
  }
}
