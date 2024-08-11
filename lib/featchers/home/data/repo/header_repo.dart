import 'package:ttech_attendance/core/networking/api_error_handler.dart';
import 'package:ttech_attendance/core/networking/api_result.dart';
import 'package:ttech_attendance/core/networking/api_service.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

class HeaderRepo {
  final ApiService apiService;

  HeaderRepo(this.apiService);

  Future<ApiResult<HeaderResponse>> getHeader() async {
    try {
      final response = await apiService.getHeaderDashboard();
        return ApiResult.success(response);
    } catch (error) {
     
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
