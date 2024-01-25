import 'package:erp_system/features/inventory/product/ui/widgets/product_list_view.dart';
import 'package:flutter/material.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        ProductListView(),
      ],
    );
  }
}


