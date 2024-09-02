import 'package:intl/intl.dart';

class MyConstants {
  static const String shiftType = "shiftType";
  static const List<String> languages = ["English", "العربية"];
  static DateFormat dayDateFormat = DateFormat('EEE, y,M,d  ');
  static DateFormat hoursFormat = DateFormat("hh:nn");
  static DateFormat dateFormat = DateFormat('dd-MMMM-yyyy');

  static const String temporary = "Temporary";
  static const String fullDay = "Full Day";

  static const String permission = "Permission";
    static const String request = "REquese";

  static const String myTransactions = "transaction";
  static const String credits = "credits";
  static const String salaries = "salaries";
  static const String timesOfWork = "timesOfWork";
  static const String attendanceAndDepartureReports =
      "attendanceAndDepartureReports";
  static const String myRequests = "myRequests";
  static const String mydepatures = "Departures";
  static const String myToken = "token";
  static const String isLoggedIn = 'isLoggedIn';
  static const String arabic = "ar";
  static const String english = "en";
  static const String myBearer = "Bearer";
  static const String authorization = 'Authorization';
}
