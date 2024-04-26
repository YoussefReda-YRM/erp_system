import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddEmployeeBlocListener extends StatelessWidget {
  const AddEmployeeBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEmployeeCubit, AddEmployeeState>(
      listenWhen: (previous, current) =>
          current is AddEmployeeLoading ||
          current is AddEmployeeSuccess ||
          current is AddEmployeeFailure,
      listener: (context, state) {
        if (state is AddEmployeeLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is AddEmployeeSuccess) {
          showSuccessDialog(
            context,
            'Successfully',
            'Employee added successfully!',
            ()
            {
              GoRouter.of(context).pushReplacement(AppRouter.kAllEmployeesView);
            }
          );
        } else if (state is AddEmployeeFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
