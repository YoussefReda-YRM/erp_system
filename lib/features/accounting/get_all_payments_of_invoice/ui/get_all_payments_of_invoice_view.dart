import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/accounting/get_all_payments_of_invoice/ui/widgets/get_all_payments_of_invoice_view_boyd.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllPaymentsOfInvoiceView extends StatelessWidget {
  const GetAllPaymentsOfInvoiceView({
    super.key,
    required this.invoice,
    required this.supplierId,
  });

  final GetAllInvoicesResponse invoice;
  final int supplierId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetAllPaymentsOfInvoiceViewBody(
          payments: invoice.payment ?? [],
        ),
        floatingActionButton: CustomFloatingActionButton(
          ctxt: context,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kRegisterPayment, extra: {
              "invoice": invoice,
              "supplierId": supplierId,
            });
          },
        ),
      ),
    );
  }
}
