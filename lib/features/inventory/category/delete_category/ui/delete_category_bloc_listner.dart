import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteCategoryBlocListener extends StatelessWidget {
  const DeleteCategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listenWhen: (previous, current) =>
          current is DeleteCategoryLoading ||
          current is DeleteCategorySuccess ||
          current is DeleteCategoryFailure,
      listener: (context, state) {
        if (state is DeleteCategoryLoading) {
          const CircularProgressIndicator(
            color: ColorsApp.primaryColor,
          );
        } else if (state is DeleteCategorySuccess) {
          // GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kCategoryView,
          );
          print("Successsssss");
        } else if (state is DeleteCategoryFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
