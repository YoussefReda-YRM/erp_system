import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/ui/widgets/get_all_invoices_of_supplier_view_boyd.dart';
import 'package:flutter/material.dart';

class GetAllInvoicesOfSupplierView extends StatelessWidget {
  const GetAllInvoicesOfSupplierView({super.key, required this.supplierId});

  final int supplierId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetAllInvoicesOfSupplierViewBody(
          supplierId: supplierId,
        ),
      ),
    );
  }
}
