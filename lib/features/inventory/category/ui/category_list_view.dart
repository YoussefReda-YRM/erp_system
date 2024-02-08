import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
import 'package:erp_system/features/inventory/category/data/repos/category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/get_all_category_cubit.dart';
import 'package:erp_system/features/inventory/category/logic/categorystate.dart';
import 'package:erp_system/features/inventory/category/logic/delete_category_cubit.dart';
import 'package:erp_system/features/inventory/category/ui/widget/edit_delete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String bearerToken="eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJ0ZXN0MjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ0ZXN0MjFAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiSFIiLCJleHAiOjE3MDg3Njk3MjgsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwNjkiLCJhdWQiOiJNeVNlY3VyZWRBUElVc2VycyJ9.osVgUgjh04hkH9lhD-28V5BvaK4fFr9bWoffN7GubFk";
class CategoryListView extends StatefulWidget {
  final CategoryDm category;

  CategoryListView({required this.category});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  // Assuming getIt() is correctly initialized and provides the CategoryCubit
  CategoryCubit viewmodel = getIt();

  List<SubCategories>? _subCategories;

  @override
  void initState() {
    super.initState();
    _subCategories = widget.category.subCategories;
  }

  void _removeSubCategory(SubCategories subCategory) {
    setState(() {
      _subCategories!.remove(subCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, categoryState) {
        return ListView.builder(
          itemCount: _subCategories!.length,
          itemBuilder: (context, index) {
            SubCategories subCategory = _subCategories![index]; // Extract the subcategory at the current index

            return Container(
              width: double.infinity,
              child: ListTile(
                title: Text(subCategory.subCategoryName ?? ''),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle edit logic here
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            // Delete the subcategory
                            // Assuming you have a method deleteSubcategory in your CategoryCubit
                            context.read<DeleteCategoryCubit>().deleteSubcategory(bearerToken, subCategory.subCategoryId ?? 0);

                            // Refresh the list by calling the getAllCategories method from the CategoryCubit
                          //  context.read<CategoryCubit>().getAllCategories(bearerToken);

                            // Remove the subcategory from the local list
                            _removeSubCategory(subCategory);

                          } catch (error) {
                            // Handle any potential errors during deletion or fetching
                            print("Error: $error");
                          }
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}