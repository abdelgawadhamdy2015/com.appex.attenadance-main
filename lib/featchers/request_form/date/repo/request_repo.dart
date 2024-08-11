import 'package:ttech_attendance/featchers/request_form/date/models/request_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/add_vaccation_response.dart';

class RequestVaccationRepo {
  final ApiService _apiService;

  RequestVaccationRepo(this._apiService);

  Future<ApiResult<AddVaccationResponse>> addVaccation(
      RequestVaccation requestVaccation) async {
    try {
      final response = await _apiService.addVaccation( requestVaccation);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
