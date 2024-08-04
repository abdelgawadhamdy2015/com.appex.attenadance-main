import 'package:dio/dio.dart';

class ApiConstants {
  static const String apiBaseUrl = "http://192.168.1.253:60/";
  //static const String apiBaseUrl = "https://sectestback.apex-program.com/";

  static const String login = "api/Login";
  static const String addRequest =
      "api/HR/VaccationEmployee/AddVaccationEmployee";
  static const String allVaccations = "api/HR/Vaccation/GetVaccationDropDown";
  static const String perfromance = "api/HR/Reports/DetailedAttendance";
  static const String dashBoardHeader =
      "api/HR/AttendLeavingDashboard/MobileHeader";
  static const String sendAttendance =
      "api/HR/EmployeeFingerprints/CheckValidEmployeeFingerprint";
  static String authToken = "";
  static late double latitude;
  static late double longitude;

  static DioExceptionType dioExceptionType = DioExceptionType.badCertificate;
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
