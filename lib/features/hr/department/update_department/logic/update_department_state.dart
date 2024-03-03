
import 'package:erp_system/features/hr/department/update_department/data/models/UpdateDepartmentResponse.dart';

abstract class UpdateDepartmentState {}

class UpdateDepartmentInitial extends UpdateDepartmentState {}

class UpdateDepartmentLoading extends UpdateDepartmentState {}

class UpdateDepartmentSuccess extends UpdateDepartmentState {
  final UpdateDepartmentResponse response;

  UpdateDepartmentSuccess({required this.response});
}

class UpdateDepartmentFailure extends UpdateDepartmentState {
  final String error;

  UpdateDepartmentFailure({required this.error});
}
