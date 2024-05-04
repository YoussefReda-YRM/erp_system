import 'package:erp_system/features/hr/job_position/add_job_position/data/model/AddJobPositionResponse.dart';

abstract class AddJobPositionState {}

class AddJobPositionInitial extends AddJobPositionState {}

class AddJobPositionLoading extends AddJobPositionState {}

class AddJobPositionFailure extends AddJobPositionState {
  final String error;

  AddJobPositionFailure({required this.error});
}

class AddJobPositionSuccess extends AddJobPositionState {
  final AddJobPositionResponse response;

  AddJobPositionSuccess({
    required this.response,
  });
}
