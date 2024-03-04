abstract class UpdateEmployeeState {}

class UpdateEmployeeInitial extends UpdateEmployeeState {}

class UpdateEmployeeLoading extends UpdateEmployeeState {}

class UpdateEmployeeSuccess extends UpdateEmployeeState {}

class UpdateEmployeeFailure extends UpdateEmployeeState {
  final String error;

  UpdateEmployeeFailure({required this.error});
}
