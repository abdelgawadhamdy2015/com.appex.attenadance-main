import 'package:ttech_attendance/core/networking/api_error_handler.dart';
import 'package:ttech_attendance/core/networking/api_result.dart';
import 'package:ttech_attendance/featchers/request/permission/data/models/permission_model.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/add_vaccation_response.dart';

import '../../../../../core/networking/api_service.dart';

class PermissionRepo {
  final ApiService apiService;

  PermissionRepo(this.apiService);

  Future<ApiResult<AddVaccationResponse>> addAttendancePermission(
    PermissionModel permissionModel) async {
    try {
      final response = await apiService.addAttendancePermission(
          permissionModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  
}
