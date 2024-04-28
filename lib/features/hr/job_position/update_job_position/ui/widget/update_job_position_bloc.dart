import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/logic/update_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/logic/update_job_position_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateJobPositionBloc extends StatelessWidget {
  const UpdateJobPositionBloc({super.key, required this.depId});
  final int depId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateJObPositionCubit, UpdateJobPositionState>(
      listenWhen: (previous, current) =>
          current is UpdateJobPositionLoading ||
          current is UpdateJobPositionSuccess ||
          current is UpdateJobPositionFailure,
      listener: (context, state) {
        if (state is UpdateJobPositionLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateJobPositionSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kGetAllJobPositionsView,
            extra: depId,
          );
        } else if (state is UpdateJobPositionFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
