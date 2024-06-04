import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/inventory/replenishment/logic/re_order_cubit.dart';
import 'package:erp_system/features/inventory/replenishment/logic/re_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReOrderBlocListener extends StatelessWidget {
  const ReOrderBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReOrderCubit, ReOrderState>(
      listenWhen: (previous, current) =>
          current is ReOrderLoading ||
          current is ReOrderSuccess ||
          current is ReOrderFailure,
      listener: (context, state) {
        if (state is ReOrderLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is ReOrderSuccess) {
          showSuccessDialog(context, 'Created Successfully',
              'Re Order has been successfully created.', () {
            GoRouter.of(context).pushReplacement(AppRouter.kReplenishmentView);
          });
        } else if (state is ReOrderFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}


