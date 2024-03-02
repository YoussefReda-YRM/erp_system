import 'package:erp_system/features/scm/supplier/update_supplier/ui/widget/update_supplier_body.dart';
import 'package:flutter/material.dart';

class UpdateSupplier extends StatelessWidget {
  final int supplierId;
  const UpdateSupplier({
    super.key,
    required this.supplierId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateSupplierBody(
        id: supplierId,
      ),
    );
  }
}
