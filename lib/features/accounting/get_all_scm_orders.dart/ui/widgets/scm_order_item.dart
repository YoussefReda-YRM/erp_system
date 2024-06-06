import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/accounting/accept_or_reject_scm_order/logic/update_status_of_scm_order_cubit.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/data/models/get_all_scm_orders_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScmOrderItem extends StatelessWidget {
  const ScmOrderItem({
    super.key,
    required this.order,
  });

  final GetAllScmOrdersResponse order;

  @override
  Widget build(BuildContext context) {
    return order.status == 0
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: ColorsApp.primaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: const EdgeInsets.all(0.8),
              child: Column(
                children: [
                  Row(
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
                                ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: ColorsApp.primaryColor,
                        size: 16,
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
                                        .read<UpdateStatusOfScmOrderCubit>()
                                        .updateStatusOfScmOrder(
                                          order.id.toString(),
                                          2,
                                        );
                                    Future.delayed(
                                      const Duration(milliseconds: 200),
                                      () {
                                        GoRouter.of(context).pushReplacement(
                                          AppRouter.kGetAllScmOrdersView,
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
                                        .read<UpdateStatusOfScmOrderCubit>()
                                        .updateStatusOfScmOrder(
                                          order.id.toString(),
                                          1,
                                        );
                                    Future.delayed(
                                      const Duration(milliseconds: 200),
                                      () {
                                        GoRouter.of(context).pushReplacement(
                                          AppRouter.kGetAllScmOrdersView,
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
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
