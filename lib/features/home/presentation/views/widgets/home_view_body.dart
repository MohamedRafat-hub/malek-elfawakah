import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:gap/gap.dart';
import 'best_selling_gridview.dart';
import 'custom_appbar_widget.dart';
import 'fruit_item.dart';
import 'home_featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbarWidget(),
                SearchTextField(),
                Gap(6),
                SizedBox(height: 180, child: HomeFeaturedList()),
                Row(
                  children: [
                    Text(
                      'الأكثر مبيعًا',
                      style: TextStyle(
                        color: Color(0xFF0C0D0D),
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'المزيد',
                      style: TextStyle(
                        color: Color(0xFF949D9E),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                Gap(5),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}




