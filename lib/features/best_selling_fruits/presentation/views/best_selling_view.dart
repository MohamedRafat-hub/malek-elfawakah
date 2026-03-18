import 'package:flutter/material.dart';
import 'package:fruit_hub/features/best_selling_fruits/presentation/views/widgets/best_seller_title.dart';
import 'package:fruit_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_notification_widget.dart';

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




