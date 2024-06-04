import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/re_order_form.dart';
import 'package:flutter/material.dart';

class ReorderViewBody extends StatelessWidget {
  const ReorderViewBody({super.key, required this.data});

  final StockOutProductsResponse data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: "Re-order",
          iconLeading: CustomBackButton(),
        ),
        Expanded(
          child: CustomAppBody(
            child: SizedBox(
              width: double.infinity,
              child: ReOrderForm(data: data),
            ),
          ),
        ),
      ],
    );
  }
}
