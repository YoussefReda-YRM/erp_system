import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderScmItem extends StatelessWidget {
  const OrderScmItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Text(
                  "245-s21",
                  style: Styles.font14BlueSemiBold(context),
                ),
                title: Center(
                  child: Text(
                    "Finished",
                    style: Styles.font14BlueSemiBold(context)
                        .copyWith(color: Colors.green),
                  ),
                ),
                trailing: SizedBox(
                  child: Text(
                    "Ayat/Giza",
                    style: Styles.font14BlueSemiBold(context),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.pink,
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
