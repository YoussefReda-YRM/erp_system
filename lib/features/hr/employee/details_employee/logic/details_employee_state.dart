import 'package:erp_system/features/hr/employee/details_employee/data/models/details_employee_model.dart';

abstract class DetailsEmployeeState {}

class DetailsEmployeeInitial extends DetailsEmployeeState {}

class DetailsEmployeeLoading extends DetailsEmployeeState {}

class DetailsEmployeeFailure extends DetailsEmployeeState {
  final String error;

  DetailsEmployeeFailure({required this.error});
}

class DetailsEmployeeSuccess extends DetailsEmployeeState {
  final DetailsEmployeeModel response;

  DetailsEmployeeSuccess({
    required this.response,
  });
}
