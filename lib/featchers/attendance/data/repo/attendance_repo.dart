import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class AttendanceRepo {
  ApiService apiService;
  AttendanceRepo(this.apiService);

  Future<ApiResult<HeaderResponse>> getAttendance() async {
    try {
      final response = await apiService.getHeaderDashboard();
      return ApiResult.success(response);
    } catch (error) {

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  
}
