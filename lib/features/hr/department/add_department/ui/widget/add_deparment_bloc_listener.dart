import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/department/add_department/logic/add_department_cubit.dart';
import 'package:erp_system/features/hr/department/add_department/logic/add_department_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddDepartmentBlocListener extends StatelessWidget {
  const AddDepartmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddDepartmentCubit, AddDepartmentState>(
      listenWhen: (previous, current) =>
      current is AddDepartmentLoading ||
          current is AddDepartmentSuccess ||
          current is AddDepartmentFailure,
      listener: (context, state) {
        if (state is AddDepartmentLoading) {
          customLoadingIndicator(context);
        } else if (state is AddDepartmentSuccess) {
        //  GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kAllDepartmentsView,
          );
        } else if (state is AddDepartmentFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
