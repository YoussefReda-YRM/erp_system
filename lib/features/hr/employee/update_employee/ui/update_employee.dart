import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';
import 'package:erp_system/features/hr/employee/update_employee/ui/widgets/update_employee_body.dart';
import 'package:flutter/material.dart';

class UpdateEmployeeView extends StatelessWidget {
  final EmployeeData employeeData;
  const UpdateEmployeeView({
    super.key,
    required this.employeeData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateEmployeeBody(
        employeeData: employeeData,
      ),
    );
  }
}
