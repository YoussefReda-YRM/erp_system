import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';

abstract class GetAllJobPositionState {}

class GetAllJobPositionInitial extends GetAllJobPositionState {}

class GetAllJobPositionLoading extends GetAllJobPositionState {}

class GetAllJobPositionFailure extends GetAllJobPositionState {
  final String error;

  GetAllJobPositionFailure({required this.error});
}

class GetAllJobPositionSuccess extends GetAllJobPositionState {
  final List<GetAllJobPositionResponse> response;

  GetAllJobPositionSuccess({
    required this.response,
  });
}