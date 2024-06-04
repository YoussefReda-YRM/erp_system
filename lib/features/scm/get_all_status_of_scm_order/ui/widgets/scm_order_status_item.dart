import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/data/models/get_all_scm_order_status_Response.dart';
import 'package:flutter/material.dart';

class ScmOrderStatusItem extends StatelessWidget {
  const ScmOrderStatusItem({
    super.key,
    required this.data,
  });

  final GetAllScmOrderStatusResponse data;

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    switch (data.status) {
      case 0:
        iconColor = Colors.orange;
        break;
      case 1:
        iconColor = Colors.green;
        break;
      default:
        iconColor = Colors.red;
    }
    return Card(
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Icon(
                data.status == 0
                    ? Icons.pending_actions_outlined
                    : data.status == 1 ?
                    Icons.check_circle_outlined : Icons.cancel_outlined ,
                color: iconColor,
                size: 34,
              ),
              title: Center(
                child: Text(
                  "#${data.orderId}",
                  style: Styles.font14BlueSemiBold(context),
                ),
              ),
              trailing: SizedBox(
                child: Text(
                  data.status == 0 ? "Pending" :data.status == 1 ?"Finished" : "Rejected",
                  style: Styles.font14BlueSemiBold(context).copyWith(
                      color: iconColor),
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
    );
  }
}
