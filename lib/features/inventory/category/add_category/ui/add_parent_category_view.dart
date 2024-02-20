import 'package:erp_system/features/inventory/category/add_category/ui/widgets/add_parent_category_body.dart';
import 'package:flutter/material.dart';

class AddParentCategoryView extends StatelessWidget {
  const AddParentCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddParentCategoryBody(),
    );
  }
}
