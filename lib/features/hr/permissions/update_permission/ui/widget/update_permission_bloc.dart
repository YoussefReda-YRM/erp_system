import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdatePermissionBloc extends StatelessWidget {
  const UpdatePermissionBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePermissionCubit, UpdatePermissionState>(
      listenWhen: (previous, current) =>
      current is UpdatePermissionLoading ||
          current is UpdatePermissionSuccess ||
          current is UpdatePermissionFailure,
      listener: (context, state) {
        if (state is UpdatePermissionLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdatePermissionSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kGetPermissionOfSpecificEmployeeView,
          );
        } else if (state is UpdatePermissionFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
