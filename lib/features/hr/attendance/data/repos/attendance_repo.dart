import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/attendance/data/models/attendance_response.dart';

class AttendanceRepo {
  final ApiService _apiService;
  AttendanceRepo(this._apiService);

  Future<ApiResult<AttendanceResponse>> getAllAttendance() async {
    try {
      var response = await _apiService.getAllAttendance(
       
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
