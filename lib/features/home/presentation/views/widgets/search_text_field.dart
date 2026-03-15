import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'ابحث عن.......',
            prefixIcon: SizedBox(
                width: 20,
                child: Center(
                    child: SvgPicture.asset('assets/icons/search_icon.svg'))),
            suffixIcon: SizedBox(
                width: 20,
                child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/filtering_icon.svg',
                      color: AppColors.primaryColor,
                    ))),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}