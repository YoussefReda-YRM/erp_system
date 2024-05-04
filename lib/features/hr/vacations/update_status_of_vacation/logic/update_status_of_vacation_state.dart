import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/models/pdate_status_of_vacation_response.dart';

abstract class UpdateStatusOfVacationState {}

class UpdateStatusOfVacationInitial extends UpdateStatusOfVacationState {}

class UpdateStatusOfVacationLoading extends UpdateStatusOfVacationState {}

class UpdateStatusOfVacationSuccess extends UpdateStatusOfVacationState {
  final UpdateStatusOfVacationResponse response;

  UpdateStatusOfVacationSuccess({required this.response});
}

class UpdateStatusOfVacationFailure extends UpdateStatusOfVacationState {
  final String error;

  UpdateStatusOfVacationFailure({required this.error});
}
