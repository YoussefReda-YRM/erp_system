import 'package:erp_system/features/modules/ui/widgets/modules_view_body.dart';
import 'package:flutter/material.dart';

class ModulesView extends StatelessWidget {
  const ModulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ModulesViewBody(),
    );
  }
}