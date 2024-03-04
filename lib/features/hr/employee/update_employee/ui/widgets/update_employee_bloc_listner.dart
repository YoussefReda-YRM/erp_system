import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_parent_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateEmployeeBlocListener extends StatelessWidget {
  const UpdateEmployeeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateParentCategoryCubit, UpdateParentCategoryState>(
      listenWhen: (previous, current) =>
          current is UpdateParentCategoryLoading ||
          current is UpdateParentCategorySuccess ||
          current is UpdateParentCategoryFailure,
      listener: (context, state) {
        if (state is UpdateParentCategoryLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateParentCategorySuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kCategoryView,
          );
        } else if (state is UpdateParentCategoryFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
