// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/shimmer_widgets/attendance_shimmer.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_bloc_listener.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_board_tablet.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/work_time_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class AttendanceScreenTablet extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const AttendanceScreenTablet({super.key, required this.changeLanguage});

  @override
  State<AttendanceScreenTablet> createState() => _AttendanceScreenTablet();
}

class _AttendanceScreenTablet extends State<AttendanceScreenTablet> {
  // String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'default_api_key';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateFormat dateFormat = DateFormat('EEE, y,M,d  ');
  bool isSignIn = false;
  final TextEditingController _notesController = TextEditingController();
  late GoogleMapController controller;
  Location location = Location();

  String token = '';
  @override
  void initState() {
    super.initState();
    initLocation();
  }

  Future<void> initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final LocationData locationData = await location.getLocation();
    context.read<AttendanceCubit>().currentPosition =
        LatLng(locationData.latitude!, locationData.longitude!);

    location.onLocationChanged.listen((LocationData currentLocation) {
      context.read<AttendanceCubit>().currentPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  // Future<void> _requestPermissions() async {
  //   await Permission.location.request();
  //   await Permission.camera.request();
  //   await Permission.microphone.request();
  // }

  // Future<void> _openCamera() async {
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  //   await Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => CameraScreen(camera: firstCamera),
  //   ));
  // }

  // Future<void> _recordAudio() async {
  //   // منطق تسجيل الصوت
  // }

  getAttendance(BuildContext context) {
    context.read<AttendanceCubit>().emitAttendanceState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getAttendance(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBarTablet(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: MyConstants.myTransactions),
      drawer: const Drawer(child: MyDrawer()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AttendanceBlocListener(),
              BlocBuilder<AttendanceCubit, AttendanceState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const AttendanceShimmer();
                  }
                  return Padding(
                    key: context.read<AttendanceCubit>().formKey,
                    padding: SizeConfig().getScreenPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AttendanceBoardTablet(),
                        verticalSpacing(SizeConfig.screenHeight! * .01),
                        TextField(
                          mouseCursor: SystemMouseCursors.basic,
                          maxLines: 3,
                          controller: _notesController,
                          decoration: InputDecoration(
                            labelStyle: TextStyles.font28Blackreguler,
                            labelText: S.of(context).notes,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        WorkTimeTablet(
                            data: context.read<AttendanceCubit>().data),
                        Container(
                          height: SizeConfig.screenHeight! * .3,
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.screenHeight! * .01),
                          child: Stack(
                            children: [
                              Card(
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: context
                                        .read<AttendanceCubit>()
                                        .currentPosition,
                                    zoom: 14,
                                  ),
                                  myLocationEnabled: true,
                                  markers: {
                                    Marker(
                                      markerId: const MarkerId('my location'),
                                      position: context
                                          .read<AttendanceCubit>()
                                          .currentPosition,
                                      infoWindow: const InfoWindow(
                                        title: 'My Marker',
                                        snippet: 'This is a snippet',
                                      ),
                                    ),
                                  },
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    this.controller = controller;
                                    controller.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: context
                                                .read<AttendanceCubit>()
                                                .currentPosition,
                                            zoom: 18),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  //width: double.infinity,
                                  height: SizeConfig.screenHeight! * .03,
                                  color: ColorManger.darkBlue,
                                  alignment: Alignment.center,
                                  child: Text(
                                    S.of(context).location,
                                    style: TextStyles.font28BlackBold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
