import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/logic/apply_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/logic/apply_vacation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ApplyVacationBlocListener extends StatelessWidget {
  const ApplyVacationBlocListener({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyVacationCubit, ApplyVacatinState>(
      listenWhen: (previous, current) =>
          current is ApplyVacationLoading ||
          current is ApplyVacationSuccess ||
          current is ApplyVacationFailure,
      listener: (context, state) {
        if (state is ApplyVacationLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is ApplyVacationSuccess) {
          showSuccessDialog(
              context, 'Successfully', 'Vacation Applied Successfully', () {
            GoRouter.of(context).pushReplacement(
                AppRouter.kGetAllVacationOfSpecificEmployeeView,
                extra: title);
          });
        } else if (state is ApplyVacationFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
