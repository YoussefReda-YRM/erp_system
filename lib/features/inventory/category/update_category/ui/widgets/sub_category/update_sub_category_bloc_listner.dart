import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_sub_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateSubCategoryBlocListener extends StatelessWidget {
  const UpdateSubCategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateSubCategoryCubit, UpdateSubCategoryState>(
      listenWhen: (previous, current) =>
          current is UpdateSubCategoryLoading ||
          current is UpdateSubCategorySuccess ||
          current is UpdateSubCategoryFailure,
      listener: (context, state) {
        if (state is UpdateSubCategoryLoading) {
          customLoadingIndicator(context);
        } else if (state is UpdateSubCategorySuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kCategoryView,
          );
        } else if (state is UpdateSubCategoryFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
