import 'package:erp_system/features/hr/permissions/delete_permission/data/models/DeletePermissionResponse.dart';

abstract class DeletePermissionState {}

class DeletePermissionInitial extends DeletePermissionState {}

class DeletePermissionLoading extends DeletePermissionState {}

class DeletePermissionSuccess extends DeletePermissionState {
  final DeletePermissionResponse response;

  DeletePermissionSuccess(this.response);
}

class GetAllPermissionFailure extends DeletePermissionState {
  final String error;
  GetAllPermissionFailure({required this.error});
}