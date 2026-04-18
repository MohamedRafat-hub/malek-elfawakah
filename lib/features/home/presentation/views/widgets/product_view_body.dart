import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:gap/gap.dart';

import 'products_grid_view_bloc_builder.dart';
import 'custom_notification_widget.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

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
                CustomProductsAppBar(),
                SearchTextField(),
                ProductsViewHeader(productsLength: context.read<ProductsCubit>().productsLength,),
                Gap(10),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

class CustomProductsAppBar extends StatelessWidget {
  const CustomProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text(
          'المنتجات',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomNotificationWidget(),
        ),
      ],
    );
  }
}


class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          '$productsLength  نتائج ',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0x66CACECE),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: SvgPicture.asset('assets/icons/filter_icon.svg'),
            ),
          ),
        ),
      ],
    );
  }
}

