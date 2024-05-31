import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';
import 'package:erp_system/features/accounting/get_all_payments_of_supplier/ui/widgets/get_all_payments_of_supplier_list_view.dart';
import 'package:flutter/material.dart';

class GetAllPaymentsOfSupplierViewBody extends StatelessWidget {
  const GetAllPaymentsOfSupplierViewBody({
    super.key,
    required this.payments,
  });
  final List<Payments> payments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'All Payments',
          iconLeading: CustomBackButton(),
        ),
        Expanded(
          child: CustomAppBody(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GetAllPaymentsOfSupplierListView(payments: payments),
              ],
            ),
          )),
        )
      ],
    );
  }
}
