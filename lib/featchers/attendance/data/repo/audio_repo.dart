import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ttech_attendance/core/networking/api_error_handler.dart';
import 'package:ttech_attendance/core/networking/api_result.dart';
import 'package:ttech_attendance/core/networking/api_service.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_response.dart';

class AudioRepository {
  final ApiService apiService;

  AudioRepository(this.apiService);

  Future<ApiResult<AttendanceResponse>> uploadAudio(File audioFile) async {
    try {
      String fileName = audioFile.path.split('/').last;
      MultipartFile multipartFile = await MultipartFile.fromFile(
        audioFile.path,
        filename: fileName,
      );

      final response = await apiService.sendAttendanceRecord(
          0, 0, false, false, false, false, false,
          audioFile: File(audioFile.path), imageFile: File(audioFile.path));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
