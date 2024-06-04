import 'package:erp_system/features/accounting/taxes/add_taxes/ui/widget/add_taxes_body.dart';
import 'package:flutter/material.dart';

class AddTaxesView extends StatelessWidget {
  const AddTaxesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddTaxesBody(),
    );
  }
}
