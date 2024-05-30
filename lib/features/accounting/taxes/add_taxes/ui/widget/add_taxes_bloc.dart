import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/logic/add_taxes_cubit.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/logic/add_taxes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTaxesBloc extends StatelessWidget {
  const AddTaxesBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaxesCubit, AddTaxesState>(
      listenWhen: (previous, current) =>
      current is AddTaxesLoading ||
          current is AddTaxesSuccess ||
          current is AddTaxesFailure,
      listener: (context, state) {
        if (state is AddTaxesLoading) {
          customLoadingIndicator(context);
        } else if (state is AddTaxesSuccess) {
          //  GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kGetAllTaxes,
          );
        } else if (state is AddTaxesFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
