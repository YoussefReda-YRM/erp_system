import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionResponse.dart';

abstract class UpdatePermissionState {}

class UpdatePermissionInitial extends UpdatePermissionState {}

class UpdatePermissionLoading extends UpdatePermissionState {}

class UpdatePermissionSuccess extends UpdatePermissionState {
  final UpdatePermissionResponse response;

  UpdatePermissionSuccess({required this.response});
}

class UpdatePermissionFailure extends UpdatePermissionState {
  final String error;

  UpdatePermissionFailure({required this.error});
}
