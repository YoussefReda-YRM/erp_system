import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_cubit.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateDepartmentBlocListener extends StatelessWidget {
  const UpdateDepartmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateDepartmentCubit, UpdateDepartmentState>(
      listenWhen: (previous, current) =>
      current is UpdateDepartmentLoading ||
          current is UpdateDepartmentSuccess ||
          current is UpdateDepartmentFailure,
      listener: (context, state) {
        if (state is UpdateDepartmentLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateDepartmentSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kAllDepartmentsView,
          );
        } else if (state is UpdateDepartmentFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
