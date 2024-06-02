import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/orders/order_details/data/models/order_details_model.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBodyItems extends StatelessWidget {
  const OrderDetailsViewBodyItems({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Order ID: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text("#${orderDetailsModel.data!.id!}",
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Product Name: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(orderDetailsModel.data!.product!,
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Quantity Of Order: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(orderDetailsModel.data!.quantity!.toString(),
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Status Of Order: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              orderDetailsModel.data!.status! == 0 ? "Pending" : "Finished",
              style: Styles.font13BlueSemiBold(context).copyWith(
                color: orderDetailsModel.data!.status == 0
                    ? Colors.orange
                    : Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Inventory Employee: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(orderDetailsModel.data!.inventoryEmployee!,
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Accounting Employee: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(orderDetailsModel.data!.accEmployee!,
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Reference Of Order: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(orderDetailsModel.data!.reference!,
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Date Of Order: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
                paresDate(
                  orderDetailsModel.data!.date!,
                ),
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

String paresDate(String dateString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);

  // Convert to local timezone
  dateTime = dateTime.toLocal();

  // Extract only the date
  return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
}
