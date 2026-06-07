import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/git_it_service.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/repos/add_order_repo.dart';
import 'package:fruit_hub/features/checkout/presentation/managers/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/get_order_card.dart';

class LastOrdersView extends StatelessWidget {
  const LastOrdersView({super.key});

  static const String routeName = 'last-orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'طلباتي', context: context, hasLeading: true),
      body: BlocProvider(
        create: (context) =>
        AddOrderCubit(getIt.get<AddOrderRepo>())
          ..getOrders(userId: FirebaseAuth.instance.currentUser!.uid),
        child: LastOrdersViewBody(),
      ),
    );
  }
}

class LastOrdersViewBody extends StatelessWidget {
  const LastOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if(state is GetOrdersFailure)
          {
            log('Get Orders Failure: ${state.errorMessage}');
          }
        else if(state is GetOrdersSuccess)
          {
            log('Get Orders Success: ${state.orders.length} orders retrieved');
          }
      },
      builder: (context, state) {
        if(state is GetOrdersLoading)
        {
          return const Center(child: CircularProgressIndicator());
        }
        else if(state is GetOrdersFailure)
        {
          return Center(child: Text(state.errorMessage , style: TextStyle(
            color: Colors.red , fontSize: 16 , fontWeight: FontWeight.w500
          ),));
        }
        else if(state is GetOrdersSuccess)
          {
            log('Get Orders Success: ${state.orders.length} orders retrieved');
            if(state.orders.isEmpty)
              {
                return  Center(child: Text('لا يوجد طلبات سابقة' , style: TextStyle(color: AppColors.primaryColor , fontSize: 20 , fontWeight: FontWeight.w600),));
              }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    OrderCard(
                      orderEntity: state.orders[index],
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              },
            );
          }
        else
          {
            return const Center(child: Text('حدث خطأ ما برجاء اعادة المحاولة مرة أخري' , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),));

          }
      },
    );
  }
}


