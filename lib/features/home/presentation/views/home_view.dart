import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_bottom_navbar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';

import '../../domain/entities/bottom_navbar_entity.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 12),
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}







List<BottomNavBarEntity> get bottomNavBarItems => [
      BottomNavBarEntity(
          activeIcon: 'assets/icons/home_active_icon.svg',
          inActiveIcon: 'assets/icons/home_icon.svg',
          title: ' الرئيسية '),
      BottomNavBarEntity(
          activeIcon: 'assets/icons/products_active_icon.svg',
          inActiveIcon: 'assets/icons/products_icon.svg',
          title: ' المنتجات '),
      BottomNavBarEntity(
          activeIcon: 'assets/icons/cart_active_icon.svg',
          inActiveIcon: 'assets/icons/cart_icon.svg',
          title: ' سلة التسوق '),
      BottomNavBarEntity(
          activeIcon: 'assets/icons/user_active_icon.svg',
          inActiveIcon: 'assets/icons/user_icon.svg',
          title: ' حسابي '),
    ];




