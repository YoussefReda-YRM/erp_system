import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/logic/add_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/logic/add_permission_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddPermissionBloc extends StatelessWidget {
  const AddPermissionBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPermissionCubit, AddPermissionState>(
      listenWhen: (previous, current) =>
      current is AddPermissionLoading ||
          current is AddPermissionSuccess ||
          current is AddPermissionFailure,
      listener: (context, state) {
        if (state is AddPermissionLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryColor,
              ),
            ),
          );
        } else if (state is AddPermissionSuccess) {
          showSuccessDialog(
              context,
              'Successfully',
              'Permission added successfully!',
                  ()
              {
                GoRouter.of(context).pushReplacement(AppRouter.kGetPermissionOfSpecificEmployeeView);
              }
          );
        } else if (state is AddPermissionFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
