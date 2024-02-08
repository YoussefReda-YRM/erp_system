import 'package:erp_system/features/inventory/category/ui/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  final bool isParent;

  const AddCategory({Key? key, required this.isParent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomization("Add Category"),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
      )
    );
  }
}
