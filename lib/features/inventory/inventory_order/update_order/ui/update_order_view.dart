import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/data/models/order_details_model.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/ui/widgets/update_order_view_body.dart';
import 'package:flutter/material.dart';

class UpdateOrderView extends StatelessWidget {
  final OrderDetailsModel orderData;

  const UpdateOrderView({
    super.key,
    required this.orderData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateOrderBody(
        orderData: orderData,
      ),
    );
  }
}
