import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/accounting/get_all_payments_of_invoice/ui/widgets/get_all_payments_of_invoice_view_boyd.dart';
import 'package:flutter/material.dart';

class GetAllPaymentsOfInvoiceView extends StatelessWidget {
  const GetAllPaymentsOfInvoiceView({
    super.key,
    required this.invoice,
  });

  final GetAllInvoicesResponse invoice;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetAllPaymentsOfInvoiceViewBody(
          payments: invoice.payment ?? [],
        ),
      ),
    );
  }
}
