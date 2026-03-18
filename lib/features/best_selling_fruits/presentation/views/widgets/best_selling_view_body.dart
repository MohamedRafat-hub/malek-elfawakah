import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../home/presentation/views/widgets/best_selling_gridview.dart';
import '../best_selling_view.dart';
import 'best_seller_title.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Gap(20),
                Row(
                  children: [
                    BestSellerTitle(),
                  ],
                ),
                Gap(12),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}