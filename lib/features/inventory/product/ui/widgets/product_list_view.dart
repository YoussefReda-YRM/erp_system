import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/product/ui/widgets/product_list_view_item.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(
        color: ColorsApp.primaryColor
      )),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductListViewItem();
        },
      ),
    );
  }
}
