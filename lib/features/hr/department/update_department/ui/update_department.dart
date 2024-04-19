import 'package:erp_system/features/hr/department/get_all_department/data/models/getAllDepartment.dart';
import 'package:erp_system/features/hr/department/update_department/ui/widget/update_department_body.dart';
import 'package:flutter/material.dart';

class UpdateDepartment extends StatelessWidget {
  final GetAllDepartmentResponse departmentData;
  const UpdateDepartment({
    super.key,
    required this.departmentData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateDepartmentBody(
        departmentData: departmentData,
      ),
    );
  }
}
