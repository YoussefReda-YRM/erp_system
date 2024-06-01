import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/data/models/get_all_scm_orders_response.dart';
import 'package:flutter/material.dart';

class ScmOrderItem extends StatelessWidget {
  const ScmOrderItem({
    super.key,
    required this.order,
  });

  final GetAllScmOrdersResponse order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        margin: const EdgeInsets.all(0.8),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  'Reference: ${order.reference}',
                  style: Styles.font14BlueSemiBold(context),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var product in order.scmOrderProducts!)
                      Text(
                        'Name: ${product.productName} - Quantity: ${product.quantity}',
                        style: Styles.font14BlueSemiBold(context),
                      )
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.shopping_cart_checkout_outlined,
              color: ColorsApp.primaryColor,
              size: 14,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
