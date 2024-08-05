// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ttech_attendance/core/helpers/auoth_provider.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/shimmer_widgets/attendance_shimmer.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_bloc_listener.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_board_tablet.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/test_attendance_bord.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/work_time_board.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/work_time_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../logic/cubit/attendance_state.dart';

class AttendanceScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const AttendanceScreen({super.key, required this.changeLanguage});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreen();
}

class _AttendanceScreen extends State<AttendanceScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateFormat dateFormat = DateFormat('EEE, y,M,d  ');
  bool isSignIn = false;
  final TextEditingController _notesController = TextEditingController();
  late GoogleMapController controller;
  Location location = Location();


  String token = '';
  late AuthProvider authProvider;
  @override
  void initState() {
    super.initState();
    // location = Location();
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   _mapController?.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
    //       zoom: 16,
    //     ),
    //   ));
    //
    //   context.read<AttendanceCubit>().locationData = currentLocation;
    // });
    // _requestPermissions();
    // // fetchLocation();
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
    context.read<AttendanceCubit>().currentPosition = LatLng(locationData.latitude!, locationData.longitude!);

    location.onLocationChanged.listen((LocationData currentLocation) {

        context.read<AttendanceCubit>().currentPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);


    });
  }




  // Future<void> fetchLocation() async {
  //   try {
  //     context.read<AttendanceCubit>().locationData =
  //         await location.getLocation();
  //     setState(() {
  //       _mapController!.animateCamera(
  //         CameraUpdate.newCameraPosition(
  //           CameraPosition(
  //             target: LatLng(
  //                 context.read<AttendanceCubit>().locationData!.latitude!,
  //                 context.read<AttendanceCubit>().locationData!.longitude!),
  //             zoom: 15.0,
  //           ),
  //         ),
  //       );
  //     });
  //   } catch (e) {
  //     setupDialogState(
  //       context,
  //       'Could not get the location: $e',
  //       true,
  //     );
  //   }
  // }

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
    context.read<AttendanceCubit>().emitAttendanceState("$myBearer $token");
  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.token != null) {
      token = authProvider.token!;
      getAttendance(context);
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: myTransactions),
      drawer: const Drawer(child: MyDrawer()),
      body: OfflineBuilderWidget(
        child: SafeArea(
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
                      key: context
                          .read<AttendanceCubit>()
                          .formKey,
                      padding: EdgeInsets.all(15.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ResponsiveBreakpoints
                              .of(context)
                              .isMobile
                              ? const TestAttendanceBord()
                              : const AttendanceBoardTablet(),
                          verticalSpacing(16),
                          TextField(
                            mouseCursor: SystemMouseCursors.basic,
                            maxLines: 3,
                            controller: _notesController,
                            decoration: InputDecoration(
                              labelStyle: TextStyles.font12black54Reguler,
                              labelText: S
                                  .of(context)
                                  .notes,
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          verticalSpacing(5),
                          ResponsiveBreakpoints
                              .of(context)
                              .isMobile
                              ? WorkTimeBoard(
                              data: context
                                  .read<AttendanceCubit>()
                                  .data)
                              : const WorkTimeTablet(),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .3,
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Card(
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: context
                                      .read<AttendanceCubit>()
                                      .currentPosition,
                                  zoom: 14,
                                ),
                                myLocationEnabled: true,
                                onMapCreated: (GoogleMapController controller) {
                                  this.controller = controller;
                                  controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                          target: context
                                              .read<AttendanceCubit>()
                                              .currentPosition, zoom: 14),
                                    ),
                                  );
                                },
                              ),
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
      ),
    );
  }}