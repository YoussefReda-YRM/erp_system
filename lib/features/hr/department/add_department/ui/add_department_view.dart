import 'package:erp_system/features/hr/department/add_department/ui/widget/add_department_body.dart';
import 'package:flutter/material.dart';

class AddDepartmentView extends StatelessWidget {
  const AddDepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddDepartmentBody(),
    );
  }
}
