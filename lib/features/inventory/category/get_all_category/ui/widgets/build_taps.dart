import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:erp_system/features/inventory/category/get_all_category/ui/widgets/build_tap.dart';
import 'package:erp_system/features/inventory/category/get_all_category/ui/widgets/category_list_view.dart';
import 'package:erp_system/features/inventory/category/get_all_category/ui/widgets/circular_elevated_button.dart';
import 'package:flutter/material.dart';

class BuildTaps extends StatefulWidget {
  const BuildTaps({
    super.key,
    required this.categories,
    required this.firstParentId,
  });
  final List<CategoryAllCategoryModel> categories;
  final int firstParentId;

  @override
  State<BuildTaps> createState() => _BuildTapsState();
}

class _BuildTapsState extends State<BuildTaps> {
  // int currentTab = 0;
  int? selectedParentCategoryId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      initialIndex: indexOfListViewInGetAllCategory,
      child: Column(
        children: [
          CircularElevatedButton(
            parentCategoryId: selectedParentCategoryId ?? widget.firstParentId,
            parentCategoryName: widget
                .categories[indexOfListViewInGetAllCategory]
                .parentCategoryName!,
          ),
          const SizedBox(
            height: 20,
          ),
          TabBar(
            onTap: (index) {
              setState(() {
                indexOfListViewInGetAllCategory = index;
                selectedParentCategoryId =
                    widget.categories[index].parentCategoryId;
              });
            },
            indicatorColor: Colors.pink,
            isScrollable: true,
            tabs: widget.categories
                .map(
                  (category) => buildTab(
                    context,
                    category,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: TabBarView(
              children: widget.categories.map((category) {
                return CategoryListView(
                  category: category,
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
