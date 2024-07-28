import '../../../../core/neworking/api_error_handler.dart';
import '../../../../core/neworking/api_result.dart';
import '../../../../core/neworking/api_service.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
