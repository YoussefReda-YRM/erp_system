import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/logic/add_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/logic/add_job_position_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddJobPositionBloc extends StatelessWidget {
  const AddJobPositionBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddJobPositionCubit, AddJobPositionState>(
      listenWhen: (previous, current) =>
      current is AddJobPositionLoading ||
          current is AddJobPositionSuccess ||
          current is AddJobPositionFailure,
      listener: (context, state) {
        if (state is AddJobPositionLoading) {
          customLoadingIndicator(context);
        } else if (state is AddJobPositionSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kGetAllJobPositionsView,
          );
        } else if (state is AddJobPositionFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
