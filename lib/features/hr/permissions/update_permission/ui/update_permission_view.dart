import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_permission/ui/widget/update_permission_body.dart';
import 'package:flutter/material.dart';

class UpdatePermissionView extends StatelessWidget {
  const UpdatePermissionView({super.key,required this.getPermissionOfSpecificEmployeeResponse});
  final GetPermissionOfSpecificEmployeeResponse getPermissionOfSpecificEmployeeResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdatePermissionBody(
         getPermissionOfSpecificEmployeeResponse: getPermissionOfSpecificEmployeeResponse ,
      ),
    );
  }
}
