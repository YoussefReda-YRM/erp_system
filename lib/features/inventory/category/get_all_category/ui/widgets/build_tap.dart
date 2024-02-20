import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:flutter/material.dart';

Widget buildTab(BuildContext context, CategoryAllCategoryModel category) {
  return Text(
    category.parentCategoryName ?? "none",
    style: Styles.font18DarkBlueBold(context).copyWith(
      color:  ColorsApp.primaryColor,
    ),
  );
}

// Container(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     decoration: BoxDecoration(
//       color: isSelected ? ColorsApp.primaryColor : Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       border: Border.all(
//         color: ColorsApp.primaryColor,
//         width: 1,
//       ),
//     ),
//     child: 
