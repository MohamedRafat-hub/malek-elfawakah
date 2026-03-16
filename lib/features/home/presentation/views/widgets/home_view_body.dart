import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:gap/gap.dart';
import 'custom_appbar_widget.dart';
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
              spacing: 16,
              children: [
                CustomAppbarWidget(),
                SearchTextField(),
                SizedBox(height: 180, child: HomeFeaturedList()),
                Row(
                  children: [
                    Text(
                      'الأكثر مبيعًا',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Spacer(),

                    Text(
                      'المزيد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF949D9E),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
