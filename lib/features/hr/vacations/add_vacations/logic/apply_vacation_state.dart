import 'package:erp_system/features/hr/vacations/add_vacations/data/models/apply_vacation_response.dart';

abstract class ApplyVacatinState {}

class ApplyVacationInitial extends ApplyVacatinState {}

class ApplyVacationLoading extends ApplyVacatinState {}

class ApplyVacationFailure extends ApplyVacatinState {
  final String error;

  ApplyVacationFailure({required this.error});
}

class ApplyVacationSuccess extends ApplyVacatinState {
  final ApplyVacationResponse response;

  ApplyVacationSuccess({
    required this.response,
  });
}
