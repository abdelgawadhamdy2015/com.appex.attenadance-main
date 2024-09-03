import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/ui/attendance.dart';
import 'package:ttech_attendance/featchers/departures/ui/departures_screen.dart';
import 'package:ttech_attendance/featchers/forget_password/cubit/froget_password_cubit.dart';
import 'package:ttech_attendance/featchers/forget_password/forget_password_screen.dart';
import 'package:ttech_attendance/featchers/home/ui/home.dart';
import 'package:ttech_attendance/featchers/login/ui/login.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/performance.dart';
import 'package:ttech_attendance/featchers/request/my_requests.dart';
import 'package:ttech_attendance/featchers/request/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/request/permission/ui/widgets/check_box_state.dart';
import 'package:ttech_attendance/featchers/request/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/splash/splash_screen.dart';
import 'package:ttech_attendance/generated/l10n.dart';
import 'core/di/dependancy_injection.dart';
import 'core/routing/routes.dart';
import 'featchers/home/logic/cubit/home_cubit.dart';
import 'featchers/login/logic/cubit/login_cubit.dart';
import 'featchers/request/request_form/logic/cubit/request_vaccation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale(Intl.defaultLocale ?? MyConstants.arabic);

  _MyAppState();

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: OfflineBuilderWidget(
        materialApp: MaterialApp(
          themeMode: ThemeMode.light,
          navigatorKey: navigatorKey,
          builder: DevicePreview.appBuilder,
          theme: ThemeData(scaffoldBackgroundColor: ColorManger.backGroundGray),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          locale: _locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: generateRoute,
          initialRoute: Routes.splashScreen,
        ),
      ),
    );
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: SplashScreen(
              changeLanguage: _changeLanguage,
            ),
          ),
        );
      case Routes.departuresScreen:
        return MaterialPageRoute(
          builder: (_) => DeparturesScreen(
            changeLanguage: _changeLanguage,
          ),
        );
      case Routes.attendaceScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<AttendanceCubit>()),
              BlocProvider(create: (context) => getIt<SendAttendanceCubit>())
            ],
            child: Attendance(
              changeLanguage: _changeLanguage,
            ),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: Login(
              changeLanguage: _changeLanguage,
            ),
          ),
        );

      case Routes.forgetPasswordSccreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FrogetPasswordCubit>(),
                  child: ForgetPassword(
                    changeLanguage: _changeLanguage,
                  ),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => getIt<HomeCubit>()),
                ], child: Home(changeLanguage: _changeLanguage)));

      case Routes.performancePanelScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<PerformanceEmployeeCubit>(),
                  child: Performance(
                    changeLanguage: _changeLanguage,
                  ),
                ));

      case Routes.requestFormScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) => getIt<RequestVaccationCubit>()),
                  BlocProvider(
                      create: (context) => getIt<AllVaccationsCubit>()),
                  BlocProvider(create: (context) => getIt<PermissionCubit>()),
                  ChangeNotifierProvider(create: (context) => CheckboxState()),
                ], child: MyRequests(changeLanguage: _changeLanguage)));

      // case Routes.permissionScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => MultiBlocProvider(providers: [
      //             BlocProvider(create: (context) => getIt<PermissionCubit>()),
      //             ChangeNotifierProvider(create: (context) => CheckboxState()),
      //           ], child: PermissionScreen(changeLanguage: _changeLanguage)));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("no defined Route with name ${settings.name}"),
                  ),
                ));
    }
  }
}
