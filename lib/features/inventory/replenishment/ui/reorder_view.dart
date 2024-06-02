import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/reorder_view_body.dart';
import 'package:flutter/material.dart';

class ReorderView extends StatelessWidget {
  const ReorderView({super.key, required this.data});

  final ProductData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ReorderViewBody(
        data: data,
      ),
    );
  }
}
