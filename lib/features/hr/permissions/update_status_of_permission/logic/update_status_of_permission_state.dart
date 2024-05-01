
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/models/UpdateStatusOfPermissionResponse.dart';

abstract class UpdateStatusOfPermissionState {}

class UpdateStatusOfPermissionInitial extends UpdateStatusOfPermissionState {}

class UpdateStatusOfPermissionLoading extends UpdateStatusOfPermissionState {}

class UpdateStatusOfPermissionSuccess extends UpdateStatusOfPermissionState {
  final UpdateStatusOfPermissionResponse response;

  UpdateStatusOfPermissionSuccess({required this.response});
}

class UpdateStatusOfPermissionFailure extends UpdateStatusOfPermissionState {
  final String error;

  UpdateStatusOfPermissionFailure({required this.error});
}
