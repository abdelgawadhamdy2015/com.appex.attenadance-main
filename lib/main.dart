import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/ui/attendance.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_cubit.dart';
import 'package:ttech_attendance/featchers/departures/ui/departures_screen.dart';
import 'package:ttech_attendance/featchers/forget_password/cubit/froget_password_cubit.dart';
import 'package:ttech_attendance/featchers/forget_password/forget_password_screen.dart';
import 'package:ttech_attendance/featchers/home/ui/home_screen.dart';
import 'package:ttech_attendance/featchers/login/ui/login_screen.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/performance_screen.dart';
import 'package:ttech_attendance/featchers/request/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/request/permission/ui/widgets/check_box_state.dart';
import 'package:ttech_attendance/featchers/request/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request/request_screen.dart';
import 'package:ttech_attendance/featchers/splash/splash_screen.dart';
import 'package:ttech_attendance/generated/l10n.dart';
import 'core/di/dependancy_injection.dart';
import 'core/routing/routes.dart';
import 'featchers/home/logic/cubit/home_cubit.dart';
import 'featchers/login/logic/cubit/login_cubit.dart';
import 'featchers/request/request_form/logic/cubit/request_vaccation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  setupGetIt();
  try {
    await dotenv.load(fileName: ".env");
    // Ensure you're loading from the correct file

    if (kDebugMode) {
      print("dot env is --------$dotenv");
    }
  } catch (e) {
    print('Error loading .env file: $e');
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (light background)
    ),
  );
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
  static const platform = MethodChannel("com.ttech.apex_attendance/mapsApiKey");

  Locale _locale = Locale(Intl.defaultLocale ?? MyConstants.arabic);

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> sendApiKeyToNative() async {
    String? apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
    try {
      await platform.invokeMethod('setApiKey', {"apiKey": apiKey});
    } on PlatformException catch (e) {
      print("Failed to send API Key: ${e.message}");
    }
  }

  @override
  void initState() {
    super.initState();
    sendApiKeyToNative();
    // Enable system UI overlay (status and navigation bars)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        themeMode: ThemeMode.light,
        navigatorKey: navigatorKey,
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
            fontFamily: MyConstants.libreCaslonText,
            scaffoldBackgroundColor: ColorManger.backGroundGray),
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
          builder: (_) => BlocProvider(
            create: (context) => getIt<DepartureCubit>(),
            child: DeparturesScreen(
              changeLanguage: _changeLanguage,
            ),
          ),
        );
      case Routes.attendaceScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<AttendanceCubit>()),
              BlocProvider(create: (context) => getIt<SendAttendanceCubit>()),
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
            child: LoginScreen(
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
                  BlocProvider(create: (context) => getIt<DepartureCubit>()),
                ], child: HomeScreen(changeLanguage: _changeLanguage)));

      case Routes.performancePanelScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<PerformanceEmployeeCubit>(),
                  child: PerformanceScreen(
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
                ], child: RequestScreen(changeLanguage: _changeLanguage)));

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
