import 'package:fruit_hub/features/checkout/domain/entities/payment_entity.dart';

import 'details_entity.dart';
import 'order_entity.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['currency'] = this.currency;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }

  factory Amount.fromEntity(OrderEntity entity){
    return Amount(
      total: entity.calculateTotalPriceWithShipping().toString(),
      currency: entity.getCurrency(),
    );
  }
}