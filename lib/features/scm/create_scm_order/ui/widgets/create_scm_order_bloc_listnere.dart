import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/scm/create_scm_order/logic/create_scm_order_cubit.dart';
import 'package:erp_system/features/scm/create_scm_order/logic/create_scm_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateScmOrderBlocListener extends StatelessWidget {
  const CreateScmOrderBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateScmOrderCubit, CreateScmOrderState>(
      listenWhen: (previous, current) =>
          current is CreateScmOrderLoading ||
          current is CreateScmOrderSuccess ||
          current is CreateScmOrderFailure,
      listener: (context, state) {
        if (state is CreateScmOrderLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is CreateScmOrderSuccess) {
          showSuccessDialog(context, 'Created Successfully',
              'Created order has been successfully created.', () {
            // GoRouter.of(context).pushReplacement(AppRouter.kReplenishmentView);
          });
        } else if (state is CreateScmOrderFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
