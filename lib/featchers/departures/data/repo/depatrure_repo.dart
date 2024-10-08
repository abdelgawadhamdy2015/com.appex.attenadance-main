import 'package:ttech_attendance/core/networking/api_error_handler.dart';
import 'package:ttech_attendance/core/networking/api_result.dart';
import 'package:ttech_attendance/core/networking/api_service.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_response.dart';

class DepatrureRepo {
  ApiService apiService;
  DepatrureRepo(this.apiService);

  Future<ApiResult<DepartureResponse>> getPage(int pageNumber) async {
    try {
      final response = await apiService.getDepartures(pageNumber,10,true);
      return ApiResult.success(response);
    } catch (error) {

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
