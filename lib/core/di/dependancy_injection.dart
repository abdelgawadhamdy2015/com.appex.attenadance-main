import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ttech_attendance/featchers/attendance/data/repo/attendance_repo.dart';
import 'package:ttech_attendance/featchers/attendance/data/repo/send_attendance_repo.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/home/data/repo/header_repo.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/repo/performance_employee_repo.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/date/repo/all_vaccations_repo.dart';
import 'package:ttech_attendance/featchers/request_form/date/repo/request_repo.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/request_vaccation_cubit.dart';

import '../../featchers/login/data/repo/login_repo.dart';
import '../../featchers/login/logic/cubit/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //dio and apiservice
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<HeaderRepo>(() => HeaderRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<RequestVaccationRepo>(
    () => RequestVaccationRepo(getIt()),
  );
  getIt.registerFactory<RequestVaccationCubit>(
    () => RequestVaccationCubit(getIt()),
  );
  getIt.registerLazySingleton<AllVaccationsRepo>(
    () => AllVaccationsRepo(getIt()),
  );
  getIt.registerFactory<AllVaccationsCubit>(
    () => AllVaccationsCubit(getIt()),
  );

  getIt.registerLazySingleton<PerformanceEmployeeRepo>(
    () => PerformanceEmployeeRepo(getIt()),
  );
  getIt.registerFactory<PerformanceEmployeeCubit>(
    () => PerformanceEmployeeCubit(getIt()),
  );

  getIt.registerLazySingleton<AttendanceRepo>(
    () => AttendanceRepo(getIt()),
  );
  getIt.registerFactory<AttendanceCubit>(
    () => AttendanceCubit(getIt()),
  );
  getIt.registerLazySingleton<SendAttendanceRepo>(
    () => SendAttendanceRepo(getIt()),
  );
  getIt.registerFactory<SendAttendanceCubit>(
    () => SendAttendanceCubit(getIt()),
  );

  // getIt.registerSingleton<SignalRService>(SignalRService());
  // getIt.registerFactory(() => AuthCubit(getIt<SignalRService>()));
}
