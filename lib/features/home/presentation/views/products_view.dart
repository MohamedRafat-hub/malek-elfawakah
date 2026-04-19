import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/services/git_it_service.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_appbar_widget.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/product_view_body.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:gap/gap.dart';

import '../../../../core/repos/product_repo.dart';
import '../../../best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../../best_selling_fruits/presentation/views/widgets/best_seller_title.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ProductsViewBody(),
        ),
      ),
    );
  }
}


