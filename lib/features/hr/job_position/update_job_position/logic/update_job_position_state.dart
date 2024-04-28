import 'package:erp_system/features/hr/job_position/update_job_position/data/update_job_response.dart';

abstract class UpdateJobPositionState {}

class UpdateJobPositionInitial extends UpdateJobPositionState {}

class UpdateJobPositionLoading extends UpdateJobPositionState {}

class UpdateJobPositionSuccess extends UpdateJobPositionState {
  final UpdateJobResponse response;

  UpdateJobPositionSuccess({required this.response});
}

class UpdateJobPositionFailure extends UpdateJobPositionState {
  final String error;

  UpdateJobPositionFailure({required this.error});
}
