import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_sub_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddSubCategoryBlocListener extends StatelessWidget {
  const AddSubCategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSubCategoryCubit, AddSubCategoryState>(
      listenWhen: (previous, current) =>
          current is AddSubCategoryLoading ||
          current is AddSubCategorySuccess ||
          current is AddSubCategoryFailure,
      listener: (context, state) {
        if (state is AddSubCategoryLoading) {
          customLoadingIndicator(context);
        } else if (state is AddSubCategorySuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kCategoryView,
          );
        } else if (state is AddSubCategoryFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
