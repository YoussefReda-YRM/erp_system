import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllInvoicesOfSupplierItem extends StatelessWidget {
  const GetAllInvoicesOfSupplierItem({
    super.key,
    required this.invoice,
    required this.supplierId,
  });

  final GetAllInvoicesOfSupplierResponse invoice;
  final int supplierId;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: ColorsApp.primaryColor),
      ),
      color: Colors.white,
      child: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Invoice #${invoice.id}",
                    style: Styles.font15DarkBlueMedium(context),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employee : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Supplier : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                invoice.employee!,
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                invoice.supplier!,
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Bill Date",
                                  style: Styles.font13BlueSemiBold(context),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  invoice.billDate!,
                                  style: Styles.font13BlueSemiBold(context)
                                      .copyWith(color: Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Due Date",
                                  style: Styles.font13BlueSemiBold(context),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  invoice.dueDate!,
                                  style: Styles.font13BlueSemiBold(context)
                                      .copyWith(color: Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SubTotal : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "TaxTotal : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Paid : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Topay : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                invoice.subTotal.toString(),
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                invoice.taxTotal.toString(),
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                invoice.paid.toString(),
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                invoice.toPay.toString(),
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextButton(
                    backgroundColor: ColorsApp.primaryColor,
                    buttonText: "Show All Payments",
                    textStyle: Styles.font13LightGreyRegular(context),
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kGetAllPaymentsOfSupplier,
                        extra: {
                          "invoice": invoice,
                          "supplierId": supplierId,
                        },
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
