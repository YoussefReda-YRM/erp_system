import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';

abstract class GetPermissionsOfSpecificEmployeeState {}

class GetPermissionsOfSpecificEmployeeInitial extends GetPermissionsOfSpecificEmployeeState {}

class GetPermissionsOfSpecificEmployeeLoading extends GetPermissionsOfSpecificEmployeeState {}

class GetPermissionsOfSpecificEmployeeFailure extends GetPermissionsOfSpecificEmployeeState {
  final String error;

  GetPermissionsOfSpecificEmployeeFailure({required this.error});
}

class GetPermissionsOfSpecificEmployeeSuccess extends GetPermissionsOfSpecificEmployeeState {
  final List<GetPermissionOfSpecificEmployeeResponse> response;

  GetPermissionsOfSpecificEmployeeSuccess({
    required this.response,
  });
}
