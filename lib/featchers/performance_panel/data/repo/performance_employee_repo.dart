import 'package:ttech_attendance/core/neworking/api_result.dart';
import 'package:ttech_attendance/core/neworking/api_service.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_model.dart';

import '../../../../core/neworking/api_error_handler.dart';
import '../models/performance_employee_response.dart';

class PerformanceEmployeeRepo {
  final ApiService apiService;

  PerformanceEmployeeRepo(this.apiService);
  Future<ApiResult<PerformanceEmployeeResponse>> getPerfromance(
      String token, PerformanceEmployeeModel employeeModel) async {
    try {
      final response = await apiService.getPerformance(token,
          employeeModel.dateFrom, employeeModel.dateTo, employeeModel.isMobile);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
