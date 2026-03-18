import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_gridview.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_notification_widget.dart';
import 'package:gap/gap.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = "BestSellingView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: BestSellerTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomNotificationWidget(),
          ),
        ],
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: BestSellingViewBody(),
    );
  }
}

class BestSellerTitle extends StatelessWidget {
  const BestSellerTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
        fontSize: 19,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

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
