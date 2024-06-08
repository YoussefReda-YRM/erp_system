import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/logic/add_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/logic/add_supplier_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddSupplierBlocListener extends StatelessWidget {
  const AddSupplierBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSupplierCubit, AddSupplierState>(
      listenWhen: (previous, current) =>
          current is AddSupplierLoading ||
          current is AddSupplierSuccess ||
          current is AddSupplierFailure,
      listener: (context, state) {
        if (state is AddSupplierLoading) {
          customLoadingIndicator(context);
        } else if (state is AddSupplierSuccess) {
          
          //  GoRouter.of(context).pop();
          GoRouter.of(context)
              .pushReplacement(AppRouter.kSupplierView, extra: "hr");
        } else if (state is AddSupplierFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
