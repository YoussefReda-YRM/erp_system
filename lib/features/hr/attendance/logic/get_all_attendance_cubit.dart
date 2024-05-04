import 'package:erp_system/features/hr/attendance/data/repos/attendance_repo.dart';
import 'package:erp_system/features/hr/attendance/logic/get_all_attendance_state.dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllAttendanceCubit extends Cubit<GetAllAttendanceState> {
  final AttendanceRepo _attendanceRepo;
  GetAllAttendanceCubit(this._attendanceRepo)
      : super(GetAllAttendanceInitial());
  Future<void> getAllAttendance() async {
    emit(GetAllAttendanceLoading());
    var response = await _attendanceRepo.getAllAttendance();
    response.when(
      success: (getAllAttendance) {
        emit(GetAllAttendanceSuccess(
          response: getAllAttendance,
        ));
      },
      failure: (error) {
        emit(GetAllAttendanceFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
