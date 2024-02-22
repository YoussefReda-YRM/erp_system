import 'package:erp_system/features/inventory/replenishment/ui/widgets/reorder_view_body.dart';
import 'package:flutter/material.dart';

class ReorderView extends StatelessWidget {
  const ReorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ReorderViewBody(),
    );
  }
}
