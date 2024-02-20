import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddParentCategoryBlocListener extends StatelessWidget {
  const AddParentCategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddParentCategoryCubit, AddParentCategoryState>(
      listenWhen: (previous, current) =>
          current is AddParentCategoryLoading ||
          current is AddParentCategorySuccess ||
          current is AddParentCategoryFailure,
      listener: (context, state) {
        if (state is AddParentCategoryLoading) {
          customLoadingIndicator(context);
        } else if (state is AddParentCategorySuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kCategoryView,
          );
        } else if (state is AddParentCategoryFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
