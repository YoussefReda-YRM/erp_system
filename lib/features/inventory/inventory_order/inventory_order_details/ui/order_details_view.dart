import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/ui/widgets/order_details_view_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBarApp(
              title: "Details Order",
              iconLeading: CustomBackButton(),
            ),
            Expanded(
              child: CustomAppBody(
                child: OrderDetailsViewBody(title: title),
              ),
            ),
          ],
        ));
  }
}
