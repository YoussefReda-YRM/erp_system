import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/scm/orders/inventory_order/data/models/get_all_inventory_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderScmItem extends StatelessWidget {
  const OrderScmItem({
    super.key,
    required this.data,
  });

  final InventoryOrderData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kOrdersDetailsView, extra: data.id);
        },
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Icon(
                  data.status == 0
                      ? Icons.pending_actions_outlined
                      : Icons.check_circle,
                  color: data.status == 0 ? Colors.red : Colors.green,
                  size: 34,
                ),
                title: Center(
                  child: Text(
                    data.id.toString(),
                    style: Styles.font14BlueSemiBold(context),
                  ),
                ),
                trailing: SizedBox(
                  child: Text(
                    data.status == 0 ? "Pending" : "Finished",
                    style: Styles.font14BlueSemiBold(context).copyWith(
                        color: data.status == 0 ? Colors.red : Colors.green),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
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
