import 'package:erp_system/features/hr/vacations/delete_vacation/data/models/DeleteVacationResponse.dart';

abstract class DeleteVacationState {}

class DeleteVacationInitial extends DeleteVacationState {}

class DeleteVacationLoading extends DeleteVacationState {}

class DeleteVacationSuccess extends DeleteVacationState {
  final DeleteVacationResponse response;

  DeleteVacationSuccess(this.response);
}

class GetAllVacationFailure extends DeleteVacationState {
  final String error;
  GetAllVacationFailure({required this.error});
}