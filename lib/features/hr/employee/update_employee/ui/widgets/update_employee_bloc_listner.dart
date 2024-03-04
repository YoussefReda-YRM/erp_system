import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/employee/update_employee/logic/update_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/update_employee/logic/update_employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateEmployeeBlocListener extends StatelessWidget {
  const UpdateEmployeeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateEmployeeCubit, UpdateEmployeeState>(
      listenWhen: (previous, current) =>
          current is UpdateEmployeeLoading ||
          current is UpdateEmployeeSuccess ||
          current is UpdateEmployeeFailure,
      listener: (context, state) {
        if (state is UpdateEmployeeLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateEmployeeSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kAllEmployeesView,
          );
        } else if (state is UpdateEmployeeFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
