import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';
import 'package:erp_system/features/accounting/get_all_payments_of_supplier/ui/widgets/get_all_payments_of_supplier_view_boyd.dart';
import 'package:flutter/material.dart';

class GetAllPaymentsOfSupplierView extends StatelessWidget {
  const GetAllPaymentsOfSupplierView({super.key, required this.payments});

  final List<Payments>? payments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetAllPaymentsOfSupplierViewBody(
          payments: payments?? [],
        ),
      ),
    );
  }
}
