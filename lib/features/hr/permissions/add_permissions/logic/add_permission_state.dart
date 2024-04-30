import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionResponse.dart';

abstract class AddPermissionState {}

class AddPermissionInitial extends AddPermissionState {}

class AddPermissionLoading extends AddPermissionState {}

class AddPermissionFailure extends AddPermissionState {
  final String error;

  AddPermissionFailure({required this.error});
}

class AddPermissionSuccess extends AddPermissionState {
  final AddPermissionResponse response;

  AddPermissionSuccess({
    required this.response,
  });
}
