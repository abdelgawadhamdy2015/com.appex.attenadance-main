// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log out `
  String get logout {
    return Intl.message(
      'Log out ',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `DataBase Name`
  String get dbName {
    return Intl.message(
      'DataBase Name',
      name: 'dbName',
      desc: '',
      args: [],
    );
  }

  /// ` Email`
  String get email {
    return Intl.message(
      ' Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Control Board`
  String get controlBoard {
    return Intl.message(
      'Control Board',
      name: 'controlBoard',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Movements today`
  String get attendanceMovementsToday {
    return Intl.message(
      'Movements today',
      name: 'attendanceMovementsToday',
      desc: '',
      args: [],
    );
  }

  /// `Attendance `
  String get transaction {
    return Intl.message(
      'Attendance ',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get credits {
    return Intl.message(
      'Credits',
      name: 'credits',
      desc: '',
      args: [],
    );
  }

  /// `Salaries`
  String get salaries {
    return Intl.message(
      'Salaries',
      name: 'salaries',
      desc: '',
      args: [],
    );
  }

  /// `Times of work`
  String get timesOfWork {
    return Intl.message(
      'Times of work',
      name: 'timesOfWork',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get attendanceAndDepartureReports {
    return Intl.message(
      'Reports',
      name: 'attendanceAndDepartureReports',
      desc: '',
      args: [],
    );
  }

  /// `My requests`
  String get myRequests {
    return Intl.message(
      'My requests',
      name: 'myRequests',
      desc: '',
      args: [],
    );
  }

  /// `Quick access list`
  String get quickAccessList {
    return Intl.message(
      'Quick access list',
      name: 'quickAccessList',
      desc: '',
      args: [],
    );
  }

  /// `Events and approvals`
  String get eventsApprovals {
    return Intl.message(
      'Events and approvals',
      name: 'eventsApprovals',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Leaving`
  String get leaving {
    return Intl.message(
      'Leaving',
      name: 'leaving',
      desc: '',
      args: [],
    );
  }

  /// `Annual`
  String get annual {
    return Intl.message(
      'Annual',
      name: 'annual',
      desc: '',
      args: [],
    );
  }

  /// `ٌRecord presence and leave`
  String get recordPresenceAndLeave {
    return Intl.message(
      'ٌRecord presence and leave',
      name: 'recordPresenceAndLeave',
      desc: '',
      args: [],
    );
  }

  /// `Attendance recorded at `
  String get attendanceRecord {
    return Intl.message(
      'Attendance recorded at ',
      name: 'attendanceRecord',
      desc: '',
      args: [],
    );
  }

  /// `Leave recorded at `
  String get leaveRecord {
    return Intl.message(
      'Leave recorded at ',
      name: 'leaveRecord',
      desc: '',
      args: [],
    );
  }

  /// `Leave for reset`
  String get leaveForReset {
    return Intl.message(
      'Leave for reset',
      name: 'leaveForReset',
      desc: '',
      args: [],
    );
  }

  /// `Come from reset`
  String get comeFromReset {
    return Intl.message(
      'Come from reset',
      name: 'comeFromReset',
      desc: '',
      args: [],
    );
  }

  /// `Check-out `
  String get signOut {
    return Intl.message(
      'Check-out ',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Check-in `
  String get signIn {
    return Intl.message(
      'Check-in ',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Work Time`
  String get workTime {
    return Intl.message(
      'Work Time',
      name: 'workTime',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `from 9:00 A.M to 6:00 P.M`
  String get dailyWorkingHours {
    return Intl.message(
      'from 9:00 A.M to 6:00 P.M',
      name: 'dailyWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `Rest 60 minutes`
  String get restMinutes {
    return Intl.message(
      'Rest 60 minutes',
      name: 'restMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Snd`
  String get send {
    return Intl.message(
      'Snd',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `please fill `
  String get pleaseFill {
    return Intl.message(
      'please fill ',
      name: 'pleaseFill',
      desc: '',
      args: [],
    );
  }

  /// `Request Leave`
  String get requestLeave {
    return Intl.message(
      'Request Leave',
      name: 'requestLeave',
      desc: '',
      args: [],
    );
  }

  /// `From Date `
  String get fromDate {
    return Intl.message(
      'From Date ',
      name: 'fromDate',
      desc: '',
      args: [],
    );
  }

  /// ` To Date`
  String get toDate {
    return Intl.message(
      ' To Date',
      name: 'toDate',
      desc: '',
      args: [],
    );
  }

  /// `Kind Of Holiday`
  String get kindOfHoliday {
    return Intl.message(
      'Kind Of Holiday',
      name: 'kindOfHoliday',
      desc: '',
      args: [],
    );
  }

  /// `Annual leave`
  String get annualLeave {
    return Intl.message(
      'Annual leave',
      name: 'annualLeave',
      desc: '',
      args: [],
    );
  }

  /// `Sick leave`
  String get sickLeave {
    return Intl.message(
      'Sick leave',
      name: 'sickLeave',
      desc: '',
      args: [],
    );
  }

  /// `Emergency leave`
  String get emergencyLeave {
    return Intl.message(
      'Emergency leave',
      name: 'emergencyLeave',
      desc: '',
      args: [],
    );
  }

  /// `Request Permission`
  String get RequestPermission {
    return Intl.message(
      'Request Permission',
      name: 'RequestPermission',
      desc: '',
      args: [],
    );
  }

  /// `Permission`
  String get permission {
    return Intl.message(
      'Permission',
      name: 'permission',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `The start date must be before the end date`
  String get dateWarning {
    return Intl.message(
      'The start date must be before the end date',
      name: 'dateWarning',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Attendance Time`
  String get attendanceTime {
    return Intl.message(
      'Attendance Time',
      name: 'attendanceTime',
      desc: '',
      args: [],
    );
  }

  /// `Leave Time`
  String get leaveTime {
    return Intl.message(
      'Leave Time',
      name: 'leaveTime',
      desc: '',
      args: [],
    );
  }

  /// `Work Hours`
  String get workHours {
    return Intl.message(
      'Work Hours',
      name: 'workHours',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found`
  String get noDateFound {
    return Intl.message(
      'No Data Found',
      name: 'noDateFound',
      desc: '',
      args: [],
    );
  }

  /// `Performance Panel`
  String get performancePanel {
    return Intl.message(
      'Performance Panel',
      name: 'performancePanel',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `A.M`
  String get am {
    return Intl.message(
      'A.M',
      name: 'am',
      desc: '',
      args: [],
    );
  }

  /// `P.M`
  String get pm {
    return Intl.message(
      'P.M',
      name: 'pm',
      desc: '',
      args: [],
    );
  }

  /// ` you not signIn yet`
  String get notAttendance {
    return Intl.message(
      ' you not signIn yet',
      name: 'notAttendance',
      desc: '',
      args: [],
    );
  }

  /// `you not signOut yet`
  String get notLeave {
    return Intl.message(
      'you not signOut yet',
      name: 'notLeave',
      desc: '',
      args: [],
    );
  }

  /// `Departures`
  String get departures {
    return Intl.message(
      'Departures',
      name: 'departures',
      desc: '',
      args: [],
    );
  }

  /// `bad response please login again`
  String get badeResponse {
    return Intl.message(
      'bad response please login again',
      name: 'badeResponse',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Attendance Reports`
  String get attendanceReports {
    return Intl.message(
      'Attendance Reports',
      name: 'attendanceReports',
      desc: '',
      args: [],
    );
  }

  /// `first shift`
  String get shift1 {
    return Intl.message(
      'first shift',
      name: 'shift1',
      desc: '',
      args: [],
    );
  }

  /// `second shift`
  String get shift2 {
    return Intl.message(
      'second shift',
      name: 'shift2',
      desc: '',
      args: [],
    );
  }

  /// `third shift`
  String get shift3 {
    return Intl.message(
      'third shift',
      name: 'shift3',
      desc: '',
      args: [],
    );
  }

  /// `fourth shift`
  String get shift4 {
    return Intl.message(
      'fourth shift',
      name: 'shift4',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hours {
    return Intl.message(
      'Hour',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `temporary`
  String get temporary {
    return Intl.message(
      'temporary',
      name: 'temporary',
      desc: '',
      args: [],
    );
  }

  /// `Full Day`
  String get fullDay {
    return Intl.message(
      'Full Day',
      name: 'fullDay',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Permission Type`
  String get permissionType {
    return Intl.message(
      'Permission Type',
      name: 'permissionType',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// ` time format (7:00 , 12:30)`
  String get matchTimeFormat {
    return Intl.message(
      ' time format (7:00 , 12:30)',
      name: 'matchTimeFormat',
      desc: '',
      args: [],
    );
  }

  /// `The shift extends to the next day`
  String get shiftToSecondDay {
    return Intl.message(
      'The shift extends to the next day',
      name: 'shiftToSecondDay',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get okDialog {
    return Intl.message(
      'OK',
      name: 'okDialog',
      desc: '',
      args: [],
    );
  }

  /// `Please select your holiday type `
  String get holidayNotSelected {
    return Intl.message(
      'Please select your holiday type ',
      name: 'holidayNotSelected',
      desc: '',
      args: [],
    );
  }

  /// ` No internet , check your connection and try again`
  String get noInternet {
    return Intl.message(
      ' No internet , check your connection and try again',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Are you shure you need log signOut? `
  String get needSignOut {
    return Intl.message(
      'Are you shure you need log signOut? ',
      name: 'needSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Late time `
  String get lateTime {
    return Intl.message(
      'Late time ',
      name: 'lateTime',
      desc: '',
      args: [],
    );
  }

  /// `Extra Time`
  String get extraTime {
    return Intl.message(
      'Extra Time',
      name: 'extraTime',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Microfone`
  String get microfone {
    return Intl.message(
      'Microfone',
      name: 'microfone',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `please ,read below line in correct way to accept attendance `
  String get readSentance {
    return Intl.message(
      'please ,read below line in correct way to accept attendance ',
      name: 'readSentance',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message(
      'Stop',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
