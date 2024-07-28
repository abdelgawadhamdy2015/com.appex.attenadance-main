import 'package:ttech_attendance/core/neworking/api_error_handler.dart';
import 'package:ttech_attendance/core/neworking/api_result.dart';
import 'package:ttech_attendance/core/neworking/api_service.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_request.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_response.dart';

class SendAttendanceRepo {
  ApiService apiService;
  SendAttendanceRepo(this.apiService);
  Future<ApiResult<AttendanceResponse>> sendAttendanceRecord(
      String token, AttendanceRequest attendanceRequest) async {
    try {
      final response = await apiService.sendAttaendanceRecord(
          token, attendanceRequest.x!, attendanceRequest.y!,attendanceRequest.isAttendFingerprint,
        attendanceRequest.isShift1Complete,attendanceRequest.isShift2Complete,
          attendanceRequest.isShift3Complete,attendanceRequest.isShift4Complete);
      return ApiResult.success(response);
    } catch (error) {

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
