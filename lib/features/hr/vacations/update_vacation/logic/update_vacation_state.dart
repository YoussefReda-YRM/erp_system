import 'package:erp_system/features/hr/vacations/update_vacation/data/models/UpdateVacationResponse.dart';

abstract class UpdateVacationState {}

class UpdateVacationInitial extends UpdateVacationState {}

class UpdateVacationLoading extends UpdateVacationState {}

class UpdateVacationSuccess extends UpdateVacationState {
  final UpdateVacationResponse response;

  UpdateVacationSuccess({required this.response});
}

class UpdateVacationFailure extends UpdateVacationState {
  final String error;

  UpdateVacationFailure({required this.error});
}
