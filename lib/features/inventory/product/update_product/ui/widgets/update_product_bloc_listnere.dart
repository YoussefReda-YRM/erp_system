import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/inventory/product/update_product/logic/update_product_cubit.dart';
import 'package:erp_system/features/inventory/product/update_product/logic/update_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateProductBlocListener extends StatelessWidget {
  const UpdateProductBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProductCubit, UpdateProductState>(
      listenWhen: (previous, current) =>
          current is UpdateProductLoading ||
          current is UpdateProductSuccess ||
          current is UpdateProductFailure,
      listener: (context, state) {
        if (state is UpdateProductLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is UpdateProductSuccess) {
          showSuccessDialog(context, 'Updated Successfully',
              'Your product has been successfully created.', () {
            GoRouter.of(context).pushReplacement(AppRouter.kProductView);
          });
        } else if (state is UpdateProductFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
