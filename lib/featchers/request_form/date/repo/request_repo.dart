import 'package:ttech_attendance/featchers/request_form/date/models/request_model.dart';

import '../../../../core/neworking/api_error_handler.dart';
import '../../../../core/neworking/api_result.dart';
import '../../../../core/neworking/api_service.dart';
import '../models/add_vaccation_response.dart';

class RequestVaccationRepo {
  final ApiService _apiService;

  RequestVaccationRepo(this._apiService);

  Future<ApiResult<AddVaccationResponse>> addVaccation(
      RequestVaccation requestVaccation, String token) async {
    try {
      final response = await _apiService.addVaccation(token, requestVaccation);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
