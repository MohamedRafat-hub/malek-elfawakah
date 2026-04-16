import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

import 'fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key, required this.products,
  });
  final List<ProductEntity>products;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 12),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return FruitItem(
              productEntity: products[index],
            );
          },
          childCount: products.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
      ),
    );
  }
}