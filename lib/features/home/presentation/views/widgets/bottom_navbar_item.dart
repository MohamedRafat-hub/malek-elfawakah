import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_navbar_entity.dart';
import 'active_item.dart';
import 'inactive_item.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavBarEntity,
  });

  final bool isSelected;
  final BottomNavBarEntity bottomNavBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
      image: bottomNavBarEntity.activeIcon,
      title: bottomNavBarEntity.title,
    )
        : InActiveItem(
      image: bottomNavBarEntity.inActiveIcon,
    );
  }
}