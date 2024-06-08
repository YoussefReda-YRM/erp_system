import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateVacationBloc extends StatelessWidget {
  const UpdateVacationBloc({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateVacationCubit, UpdateVacationState>(
      listenWhen: (previous, current) =>
          current is UpdateVacationLoading ||
          current is UpdateVacationSuccess ||
          current is UpdateVacationFailure,
      listener: (context, state) {
        if (state is UpdateVacationLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateVacationSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
              AppRouter.kGetAllVacationOfSpecificEmployeeView,
              extra: title);
        } else if (state is UpdateVacationFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
