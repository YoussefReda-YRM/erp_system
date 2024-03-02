import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateSupplierBlocListener extends StatelessWidget {
  const UpdateSupplierBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateSupplierCubit, UpdateSupplierState>(
      listenWhen: (previous, current) =>
      current is UpdateSupplierLoading ||
          current is UpdateSupplierSuccess ||
          current is UpdateSupplierFailure,
      listener: (context, state) {
        if (state is UpdateSupplierLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateSupplierSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kSupplierView,
          );
        } else if (state is UpdateSupplierFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
