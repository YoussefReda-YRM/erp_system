import 'package:erp_system/features/hr/job_position/delete_job_position/data/models/DeleteJobPositionResponse.dart';

abstract class DeleteJobPositionState {}

class DeleteJobPositionInitial extends DeleteJobPositionState {}

class DeleteJobPositionLoading extends DeleteJobPositionState {}

class DeleteJobPositionSuccess extends DeleteJobPositionState {
  final DeleteJobPositionResponse response;

  DeleteJobPositionSuccess(this.response);
}

class GetAllJobPositionFailure extends DeleteJobPositionState {
  final String error;
  GetAllJobPositionFailure({required this.error});
}