import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddProductBlocListener extends StatelessWidget {
  const AddProductBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listenWhen: (previous, current) =>
          current is AddProductLoading ||
          current is AddProductSuccess ||
          current is AddProductFailure,
      listener: (context, state) {
        if (state is AddProductLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is AddProductSuccess) {
          showSuccessDialog(
            context,
            'Created Successfully',
            'Your product has been successfully created.',
            ()
            {
              GoRouter.of(context).pushReplacement(AppRouter.kProductView);
            }
          );
        } else if (state is AddProductFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
