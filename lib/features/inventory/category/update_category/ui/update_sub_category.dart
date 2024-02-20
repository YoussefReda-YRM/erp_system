import 'package:erp_system/features/inventory/category/update_category/ui/widgets/sub_category/update_sub_category_body.dart';
import 'package:flutter/material.dart';

class UpdateSubCategory extends StatelessWidget {
  final int subid;
  final int parentid;
  const UpdateSubCategory({
    super.key,
    required this.subid,
    required this.parentid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateSubCategoryBody(
        subid: subid,
        parentid: parentid,
      ),
    );
  }
}
