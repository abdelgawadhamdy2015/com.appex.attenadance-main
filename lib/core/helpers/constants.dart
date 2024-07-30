import 'package:intl/intl.dart';

class Constants {
  String language = "English";
  String getLanguage() {
    return language;
  }

  setLanguage(String lang) {
    language = lang;
  }
}

const List<String> languages = ["English", "العربية"];
DateFormat dateFormat = DateFormat('EEE, y,M,d  ');
DateFormat hoursFormat = DateFormat("hh:nn");

const String myTransactions = "transaction";
const String credits = "credits";
const String salaries = "salaries";
const String timesOfWork = "timesOfWork";
const String attendanceAndDepartureReports = "attendanceAndDepartureReports";
const String myRequests = "myRequests";
const String mydepatures = "Departures";

const String myToken = "token";
const String isLoggedIn = 'isLoggedIn';
const String arabic = "ar";
const String english = "en";
const String myBearer = "Bearer";
const String authorization = 'Authorization';
