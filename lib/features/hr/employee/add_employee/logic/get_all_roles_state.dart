import 'package:erp_system/features/hr/employee/add_employee/data/models/get_all_roles_model.dart';

abstract class GetAllRolesState {}

class GetAllRolesInitial extends GetAllRolesState {}

class GetAllRolesLoading extends GetAllRolesState {}

class GetAllRolesSuccess extends GetAllRolesState {
  final List<GetAllRolesResponse> getAllRolesResponse;

  GetAllRolesSuccess(this.getAllRolesResponse);
}

class GetAllRolesFailure extends GetAllRolesState {
  final String error;

  GetAllRolesFailure({required this.error});
}

