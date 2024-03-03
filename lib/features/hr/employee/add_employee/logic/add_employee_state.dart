import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_response.dart';

abstract class AddEmployeeState {}

class AddEmployeeInitial extends AddEmployeeState {}

class AddEmployeeLoading extends AddEmployeeState {}

class AddEmployeeSuccess extends AddEmployeeState {
  final AddEmployeeResponse addEmployeeResponse;

  AddEmployeeSuccess(this.addEmployeeResponse);
}

class AddEmployeeFailure extends AddEmployeeState {
  final String error;

  AddEmployeeFailure({required this.error});
}
