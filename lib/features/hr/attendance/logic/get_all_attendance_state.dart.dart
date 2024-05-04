import 'package:erp_system/features/hr/attendance/data/models/attendance_response.dart';

abstract class GetAllAttendanceState {}

class GetAllAttendanceInitial extends GetAllAttendanceState {}

class GetAllAttendanceLoading extends GetAllAttendanceState {}

class GetAllAttendanceFailure extends GetAllAttendanceState {
  final String error;

  GetAllAttendanceFailure({required this.error});
}

class GetAllAttendanceSuccess extends GetAllAttendanceState {
  final AttendanceResponse response;

  GetAllAttendanceSuccess({
    required this.response,
  });
}
