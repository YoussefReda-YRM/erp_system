import 'package:erp_system/features/inventory/category/update_category/ui/widgets/parent_category/update_parent_category_body.dart';
import 'package:flutter/material.dart';

class UpdateParentCategory extends StatelessWidget {
  final int parentId;
  const UpdateParentCategory({
    super.key,
    required this.parentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateParentCategoryBody(
        parentId: parentId,
      ),
    );
  }
}
