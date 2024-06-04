import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/logic/update_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateOrderBlocListener extends StatelessWidget {
  const UpdateOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateOrderCubit, UpdateOrderState>(
      listenWhen: (previous, current) =>
          current is UpdateOrderLoading ||
          current is UpdateOrderSuccess ||
          current is UpdateOrderFailure,
      listener: (context, state) {
        if (state is UpdateOrderLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateOrderSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kInventoryOrders,
          );
        } else if (state is UpdateOrderFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
