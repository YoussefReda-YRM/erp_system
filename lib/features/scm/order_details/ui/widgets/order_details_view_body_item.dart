import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBodyItems extends StatelessWidget {
  const OrderDetailsViewBodyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Product Name: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              "T-shirt",
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
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
              "23/2/2024",
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
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
              "Finished",
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.green),
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
            Text(
              "Giza",
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
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
