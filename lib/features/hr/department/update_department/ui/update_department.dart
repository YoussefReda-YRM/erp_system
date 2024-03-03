import 'package:erp_system/features/hr/department/update_department/ui/widget/update_department_body.dart';
import 'package:flutter/material.dart';

class UpdateDepartment extends StatelessWidget {
  final int depId;
  const UpdateDepartment({
    super.key,
    required this.depId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateDepartmentBody(
        id: depId,
      ),
    );
  }
}
