import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/orders/order_details/ui/widgets/order_details_view_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBarApp(
              title: "Details Order",
              iconLeading: const CustomBackButton(),
              iconTrailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                  size: 34,
                  color: ColorsApp.lightGrey,
                ),
              ),
            ),
            const Expanded(
              child: CustomAppBody(
                child: OrderDetailsViewBody(),
              ),
            ),
          ],
        ));
  }
}
