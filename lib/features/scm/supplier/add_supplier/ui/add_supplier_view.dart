import 'package:erp_system/features/scm/supplier/add_supplier/ui/widget/add_supplier_body.dart';
import 'package:flutter/material.dart';

class AddSupplierView extends StatelessWidget {
  const AddSupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddSupplierBody(),
    );
  }
}
