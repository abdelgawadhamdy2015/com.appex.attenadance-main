import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_response.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/request/permission/data/models/permission_model.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/all_vaccations_model.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/add_vaccation_response.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/request_model.dart';
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
    @Body() RequestVaccation requestVaccation,
  );

  @GET(ApiConstants.allVaccations)
  Future<AllVaccationsModel> getAllVaccations();

  @GET(ApiConstants.perfromance)
  Future<PerformanceEmployeeResponse> getPerformance(
    @Query("dateFrom") DateTime dateFrom,
    @Query("dateTo") DateTime dateTo,
    @Query("isMobile") bool isMobile,
  );

  @GET(ApiConstants.dashBoardHeader)
  Future<HeaderResponse> getHeaderDashboard(
      // @Header(authorization) String token,
      );

  @POST(ApiConstants.sendAttendance)
  @MultiPart()
  Future<AttendanceResponse> sendAttendanceRecord(
    @Query("x") double x,
    @Query("y") double y,
    @Query("isAttendFingerprint") bool? isAttendFingerprint,
    @Query("isShift1Complete") bool? isShift1Complete,
    @Query("isShift2Complete") bool? isShift2Complete,
    @Query("isShift3Complete") bool? isShift3Complete,
    @Query("isShift4Complete") bool? isShift4Complete, {
    @Part(name: 'audio') File? audioFile,
    @Part(name: 'image') File? imageFile,
  });

  @POST(ApiConstants.addPermission)
  Future<AddVaccationResponse> addAttendancePermission(
    @Body() PermissionModel permissionModel,
  );

  @GET(ApiConstants.getVaccations)
  Future<DepartureResponse> getDepartures(
    @Query("PageNumber") int pageNumber,
    @Query("PageSize") int pageSize,
    @Query("isMobile") bool isMobile,
  );

  // x
  // @POST(ApiConstants.signup)
  // Future<SignUpResponse> signUp(
  //   @Body() SignUpRequest signUpRequest,
  // );
}
