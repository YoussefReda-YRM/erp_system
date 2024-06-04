import 'package:erp_system/features/accounting/get_all_invoices/ui/widgets/get_all_invoices_view_boyd.dart';
import 'package:flutter/material.dart';

class GetAllInvoicesView extends StatelessWidget {
  const GetAllInvoicesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetAllInvoicesViewBody(),
      ),
    );
  }
}
