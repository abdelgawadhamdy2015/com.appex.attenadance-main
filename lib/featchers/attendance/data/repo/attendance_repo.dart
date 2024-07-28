import 'package:ttech_attendance/core/neworking/api_error_handler.dart';
import 'package:ttech_attendance/core/neworking/api_result.dart';
import 'package:ttech_attendance/core/neworking/api_service.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

class AttendanceRepo {
  ApiService apiService;
  AttendanceRepo(this.apiService);

  Future<ApiResult<HeaderResponse>> getAttendance(String token) async {
    try {
      final response = await apiService.getHeaderDashboard(token);
      return ApiResult.success(response);
    } catch (error) {

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  
}
