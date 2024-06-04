import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReplenishmentItem extends StatelessWidget {
  const ReplenishmentItem({
    super.key,
    required this.data,
  });
  final StockOutProductsResponse data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF7F8F9),
      child: ListTile(
        title: Text(
          data.productName!,
          style: Styles.font18DarkBlueBold(context),
        ),
        subtitle: Text(
          "On Hand : ${data.productOnHand.toString()}",
          style: Styles.font10BlueSemiBold(context).copyWith(
            color: const Color(0xff9E9E9E),
          ),
        ),
        trailing: data.isOrdered!
            ? Text(
                "Pendind",
                style: Styles.font14BlueSemiBold(context)
                    .copyWith(color: Colors.orange),
              )
            : SizedBox(
                width: 127,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouter.kReorderView,
                      extra: data,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    backgroundColor: ColorsApp.primaryColor,
                  ),
                  child: Text(
                    "Reorder",
                    style: Styles.font16LightGreyMedium(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
