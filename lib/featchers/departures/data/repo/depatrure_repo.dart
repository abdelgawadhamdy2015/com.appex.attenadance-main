import 'package:ttech_attendance/core/networking/api_error_handler.dart';
import 'package:ttech_attendance/core/networking/api_result.dart';
import 'package:ttech_attendance/core/networking/api_service.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/add_vaccation_response.dart';

class DepatrureRepo {
  ApiService apiService;
  DepatrureRepo(this.apiService);

  Future<ApiResult<AddVaccationResponse>> getDepartures() async {
    try {
      final response = await apiService.getDeparture();
      return ApiResult.success(response);
    } catch (error) {

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
