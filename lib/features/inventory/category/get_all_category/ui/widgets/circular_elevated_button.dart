import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CircularElevatedButton extends StatelessWidget {
  const CircularElevatedButton(
      {super.key, this.parentCategoryId, required this.parentCategoryName});
  final int? parentCategoryId;
  final String parentCategoryName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kAddParentCategory);
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              backgroundColor: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Add",
                style:
                    Styles.font18DarkBlueBold(context).copyWith(fontSize: 12),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: ElevatedButton(
            onPressed: () {
              parentCategoryNameControllerInGetIt = parentCategoryName;
              GoRouter.of(context).push(
                AppRouter.kUpdateParentCategory,
                extra: parentCategoryId,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              backgroundColor: ColorsApp.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Edit",
                style:
                    Styles.font18LightGreyBold(context).copyWith(fontSize: 12),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: ElevatedButton(
            onPressed: () {
              deleteShowDialog(
                context,
                'Are you sure you want to delete this Parent Category?',
                parentCategoryId!,
                () {
                  getIt.get<CategoryCubit>().deleteparentcategory(
                        getIt.get<LoginResponse>().token!,
                        parentCategoryId!,
                      );
                  GoRouter.of(context).pop();
                  Future.delayed(const Duration(milliseconds: 200), () {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kCategoryView);
                  });
                },
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              backgroundColor: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Delete",
                style:
                    Styles.font18DarkBlueBold(context).copyWith(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
