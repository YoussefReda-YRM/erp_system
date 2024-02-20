import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/colors_app.dart';

class AddSubCategoryFloatingActionButton extends StatelessWidget {
  const AddSubCategoryFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.primaryColor,
      onPressed: () {
        if (listOfCategoryIsEmpty == false) {
          GoRouter.of(context).push(
            AppRouter.kAddSubCategory,
            extra: getIt
                .get<List<CategoryAllCategoryModel>>()[
                    indexOfListViewInGetAllCategory]
                .parentCategoryId,
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Alert",
                  style: Styles.font18DarkBlueBold(context),
                ),
                content: Text(
                  "You cannot add a subcategory without creating the parent category.",
                  style: Styles.font13BlueSemiBold(context),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Text(
        "New",
        style: Styles.font13LightGreyRegular(context),
      ),
    );
  }
}
