
import '../../../home/domain/entities/cart_item_entity.dart';
import 'item_entity.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
    return ItemList(items: items.map((e) => ItemEntity.fromEntity(e)).toList());
  }
}