import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ttech_attendance/core/helpers/auoth_provider.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/ui/attendance_screen.dart';
import 'package:ttech_attendance/featchers/departures/ui/departures_screen.dart';
import 'package:ttech_attendance/featchers/forget_password/cubit/froget_password_cubit.dart';
import 'package:ttech_attendance/featchers/forget_password/forget_password_screen.dart';
import 'package:ttech_attendance/featchers/home/ui/home_screen.dart';
import 'package:ttech_attendance/featchers/login/ui/login_screen.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/performance_panel.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/request_form_screen.dart';
import 'package:ttech_attendance/featchers/splash_screen/splash_screen.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import 'core/di/dependancy_injection.dart';
import 'core/routing/routes.dart';
import 'featchers/home/logic/cubit/home_cubit.dart';
import 'featchers/login/logic/cubit/login_cubit.dart';
import 'featchers/request_form/logic/cubit/request_vaccation_cubit.dart';

void main() {
  setupGetIt();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale(arabic);

  _MyAppState();

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 480, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
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
            child: AttendanceScreen(
              changeLanguage: _changeLanguage,
            ),
          ),
        );
      case Routes.requestFormScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) => getIt<RequestVaccationCubit>()),
                  BlocProvider(create: (context) => getIt<AllVaccationsCubit>())
                ], child: RequestFormScreen(changeLanguage: _changeLanguage)));

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(
              changeLanguage: _changeLanguage,
            ),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => getIt<HomeCubit>()),
                ], child: HomeScreen(changeLanguage: _changeLanguage)));

      case Routes.performancePanelScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<PerformanceEmployeeCubit>(),
                  child: PerformancePanel(
                    changeLanguage: _changeLanguage,
                  ),
                ));

      case Routes.forgetPasswordSccreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FrogetPasswordCubit>(),
                  child: ForgetPassword(
                    changeLanguage: _changeLanguage,
                  ),
                ));

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
