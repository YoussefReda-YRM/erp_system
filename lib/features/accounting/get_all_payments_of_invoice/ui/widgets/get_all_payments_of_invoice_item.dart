import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetAllPaymentsOfInvoiceItem extends StatelessWidget {
  const GetAllPaymentsOfInvoiceItem({
    super.key,
    required this.payment,
  });
  final Payments payment;

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
                    "Payment #${payment.id}",
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
                                "Amount : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Payment Date : ",
                                style: Styles.font13BlueSemiBold(context),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                payment.amount.toString(),
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(payment.paymentDate!)),
                                style: Styles.font13BlueSemiBold(context)
                                    .copyWith(color: Colors.pink),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
