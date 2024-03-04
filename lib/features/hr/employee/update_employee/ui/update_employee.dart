import 'package:erp_system/features/hr/employee/update_employee/ui/widgets/update_employee_body.dart';
import 'package:flutter/material.dart';

class UpdateEmployeeView extends StatelessWidget {
  final String employeeId;
  const UpdateEmployeeView({
    super.key,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateEmployeeBody(
        employeeId: employeeId,
      ),
    );
  }
}
