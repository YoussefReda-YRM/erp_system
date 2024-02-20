import 'package:erp_system/features/inventory/category/add_category/ui/widgets/add_sub_category_body.dart';
import 'package:flutter/material.dart';

class AddSubCategoryView extends StatelessWidget {
  final int parentId;

  const AddSubCategoryView({
    super.key,
    required this.parentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AddSubCategoryBody(
        parentId: parentId,
      ),
    );
  }
}
