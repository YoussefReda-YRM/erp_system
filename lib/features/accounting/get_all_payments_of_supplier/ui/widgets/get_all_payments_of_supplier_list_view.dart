import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/accounting/get_all_payments_of_supplier/ui/widgets/get_all_payments_of_supplier_item.dart';
import 'package:flutter/material.dart';

class GetAllPaymentsOfSupplierListView extends StatelessWidget {
  const GetAllPaymentsOfSupplierListView({super.key, required this.payments});

  final List<Payments> payments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.68,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: payments.length,
        itemBuilder: (context, index) {
          return GetAllPaymentsOfSupplierItem(payment: payments[index]);
        },
      ),
    );
  }
}
