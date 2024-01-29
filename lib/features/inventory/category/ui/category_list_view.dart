import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
import 'package:erp_system/features/inventory/category/data/repos/category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/category_view_model.dart';
import 'package:erp_system/features/inventory/category/ui/widget/edit_delete.dart';
import 'package:flutter/material.dart';
class CategoryListView extends StatefulWidget {

  final CategoryDm category;


  CategoryListView({required this.category});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  CategoryCubit viewmodel=getIt();
  @override
  
  Widget build(BuildContext context) {

    List<SubCategories>? subCategories = widget.category.subCategories;

    return ListView(
      children: [
        // Your existing code for the parent category
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
       //   decoration: BoxDecoration(
            //color: Colors.blue,
          //  borderRadius: BorderRadius.circular(18),
          //  border: Border.all(color: Colors.blue, width: 1),
        //  ),
          /*child: Text(
            category.parentCategoryName ?? "",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),*/
        ),
        // Subcategories as ListTiles
        ...subCategories?.map((subCategory) {
          return ListTile(
            title: Text(subCategory.subCategoryName ?? ''),
            trailing: SizedBox(
              width:80,
              child: Row(children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    if (widget.category.subCategories != null && widget.category.subCategories!.isNotEmpty) {
                      viewmodel.deleteSubcategory(widget.category.subCategories![0].subCategoryId ?? 0);
                    }

                  },
                ),
              ],
              ),
            )

            // Add other details or functionality as needed
          );
        }).toList() ?? [],
      ],
    );
  }
}



