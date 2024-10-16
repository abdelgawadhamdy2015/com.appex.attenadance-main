import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/all_vaccations_model.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/add_vaccation_response.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/request_model.dart';

import '../../featchers/attendance/data/models/attendance_response.dart';
import '../../featchers/login/data/models/login_request_body.dart';
import '../../featchers/login/data/models/login_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequestBody,
  );

  @POST(ApiConstants.addRequest)
  Future<AddVaccationResponse> addVaccation(
    @Header(authorization) String token,
    @Body() RequestVaccation requestVaccation,
  );

  @GET(ApiConstants.allVaccations)
  Future<AllVaccationsModel> getAllVaccations(
      @Header(authorization) String token);

  @GET(ApiConstants.perfromance)
  Future<PerformanceEmployeeResponse> getPerformance(
    @Header(authorization) String token,
    @Query("dateFrom") DateTime dateFrom,
    @Query("dateTo") DateTime dateTo,
    @Query("isMobile") bool isMobile,
  );

  @GET(ApiConstants.dashBoardHeader)
  Future<HeaderResponse> getHeaderDashboard(
    @Header(authorization) String token,
  );

  @POST(ApiConstants.sendAttendance)
  Future<AttendanceResponse> sendAttaendanceRecord(
      @Header(authorization) String token,
      @Query("x") double x,
      @Query("y") double y,
      @Query("isAttendFingerprint") bool? isAttendFingerprint,
      @Query("isShift1Complete") bool? isShift1Complete,
      @Query("isShift2Complete") bool? isShift2Complete,
      @Query("isShift3Complete") bool? isShift3Complete,
      @Query("isShift4Complete") bool? isShift4Complete,
      );
  // x
  // @POST(ApiConstants.signup)
  // Future<SignUpResponse> signUp(
  //   @Body() SignUpRequest signUpRequest,
  // );
}
