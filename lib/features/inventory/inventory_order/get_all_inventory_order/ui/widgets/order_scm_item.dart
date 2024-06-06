import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/accounting/accept_or_reject_inventory_order/logic/update_status_of_inventory_order_cubit.dart';
import 'package:erp_system/features/inventory/inventory_order/get_all_inventory_order/data/models/get_all_inventory_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderScmItem extends StatelessWidget {
  const OrderScmItem({
    super.key,
    required this.data,
    required this.title,
  });

  final InventoryOrderData data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ColorsApp.primaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kOrdersDetailsView,
              extra: {"id": data.id, "title": title});
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Icon(
                      data.status == 0
                          ? Icons.pending_actions_outlined
                          : Icons.check_circle,
                      color: data.status == 0 ? Colors.orange : Colors.green,
                      size: 34,
                    ),
                    title: Center(
                      child: Text(
                        "#${data.id}",
                        style: Styles.font14BlueSemiBold(context),
                      ),
                    ),
                    trailing: SizedBox(
                      child: Text(
                        data.status == 0 ? "Pending" : "Finished",
                        style: Styles.font14BlueSemiBold(context).copyWith(
                            color: data.status == 0
                                ? Colors.orange
                                : Colors.green),
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
            userRole == "AccountingEmployee"
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppTextButton(
                            borderRadius: 8,
                            buttonText: "Reject",
                            backgroundColor: const Color(0xffFF7F74),
                            textStyle: Styles.font13BlueSemiBold(context),
                            onPressed: () {
                              context
                                  .read<UpdateStatusOfInventoryOrderCubit>()
                                  .updateStatusOfInventoryOrder(
                                    data.id.toString(),
                                    2,
                                  );
                              Future.delayed(
                                const Duration(milliseconds: 200),
                                () {
                                  GoRouter.of(context).pushReplacement(
                                    AppRouter.kInventoryOrders,
                                    extra: "accounting",
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: AppTextButton(
                            borderRadius: 8,
                            buttonText: "Accept",
                            backgroundColor: const Color(0xff30BEB6),
                            textStyle: Styles.font13BlueSemiBold(context),
                            onPressed: () {
                              context
                                  .read<UpdateStatusOfInventoryOrderCubit>()
                                  .updateStatusOfInventoryOrder(
                                    data.id.toString(),
                                    1,
                                  );
                              Future.delayed(
                                const Duration(milliseconds: 200),
                                () {
                                  GoRouter.of(context).pushReplacement(
                                    AppRouter.kInventoryOrders,
                                    extra: "accounting",
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
