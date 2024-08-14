import 'package:ttech_attendance/featchers/request_form/date/models/all_vaccations_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class AllVaccationsRepo {
  final ApiService _apiService;

  AllVaccationsRepo(this._apiService);

  Future<ApiResult<AllVaccationsModel>> getVaccations() async {
    try {
      final response = await _apiService.getAllVaccations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
