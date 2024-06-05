import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_divider.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
import 'package:erp_system/features/inventory/category/get_all_sup_category/data/models/get_all_sup_category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryListView extends StatefulWidget {
  final CategoryAllCategoryModel category;

  const CategoryListView({
    super.key,
    required this.category,
  });

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.category.subCategories!.length,
      itemBuilder: (context, index) {
        GetAllSupCategoryModel subCategory =
            widget.category.subCategories![index];
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ListTile(
                title: Text(
                  subCategory.subCategoryName,
                  style: Styles.font14DarkBlueMedium(context),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          subCategoryNameControllerInGetIt =
                              subCategory.subCategoryName;
                          GoRouter.of(context).push(
                            AppRouter.kUpdateSubCategory,
                            extra: {
                              "parentId": widget.category.parentCategoryId,
                              "subId": subCategory.subCategoryId,
                              "subName": subCategory.subCategoryName
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: ColorsApp.primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await deleteShowDialog(
                            context,
                            'Are you sure you want to delete this Sub Category?',
                            () {
                              getIt.get<CategoryCubit>().deleteSubcategory(
                                   
                                    subCategory.subCategoryId,
                                  );
                              GoRouter.of(context).pop();

                              Future.delayed(const Duration(milliseconds: 200),
                                  () {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kCategoryView);
                              });
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomDivider()
          ],
        );
      },
    );
  }
}

// class MyData {
//   final CategoryDm category;
//   final int index;

//   MyData({required this.category, required this.index});
// }
