import 'package:erp_system/features/hr/permissions/get_all_permissions/data/models/GetAllPermissionResponse.dart';

abstract class GetAllPermissionsState {}

class GetAllPermissionsInitial extends GetAllPermissionsState {}

class GetAllPermissionsLoading extends GetAllPermissionsState {}

class GetAllPermissionsFailure extends GetAllPermissionsState {
  final String error;

  GetAllPermissionsFailure({required this.error});
}

class GetAllPermissionsSuccess extends GetAllPermissionsState {
  final List<GetAllPermissionResponse> response;

  GetAllPermissionsSuccess({
    required this.response,
  });
}
