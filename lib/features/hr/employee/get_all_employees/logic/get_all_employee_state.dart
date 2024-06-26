import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';

abstract class GetAllEmployeeState {}

class GetAllEmployeeInitial extends GetAllEmployeeState {}

class GetAllEmployeeLoading extends GetAllEmployeeState {}

class GetAllEmployeeFailure extends GetAllEmployeeState {
  final String error;

  GetAllEmployeeFailure({required this.error});
}

class GetAllEmployeeSuccess extends GetAllEmployeeState {
  final GetAllEmployeeResponse response;

  GetAllEmployeeSuccess({
    required this.response,
  });
}

class DeleteEmployeeInitial extends GetAllEmployeeState {}

class DeleteEmployeeLoading extends GetAllEmployeeState {}

class DeleteEmployeeSuccess extends GetAllEmployeeState {}

class DeleteEmployeeFailure extends GetAllEmployeeState {
  final String error;

  DeleteEmployeeFailure({required this.error});
}
