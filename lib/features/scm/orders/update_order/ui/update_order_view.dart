import 'package:erp_system/features/scm/orders/update_order/ui/widgets/update_order_view_body.dart';
import 'package:flutter/material.dart';

class UpdateOrderView extends StatelessWidget {
  final int orderId;
  const UpdateOrderView({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateOrderBody(
        orderId: orderId,
      ),
    );
  }
}
