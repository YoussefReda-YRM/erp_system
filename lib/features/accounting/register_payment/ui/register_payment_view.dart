import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/accounting/register_payment/ui/widget/register_payment_view_body.dart';
import 'package:flutter/material.dart';

class RegisterPaymentView extends StatelessWidget {
  const RegisterPaymentView(
      {super.key, required this.invoice, required this.supplierId});

  final GetAllInvoicesResponse invoice;
  final int supplierId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RegisterPaymentViewBody(
        invoice: invoice,
        supplierId: supplierId,
      ),
    );
  }
}
