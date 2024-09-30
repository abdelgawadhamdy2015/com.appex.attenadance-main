import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/ui/attendance_screen.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/audio_screen.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/camera_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../logic/cubit/attendance_state.dart';

class Attendance extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const Attendance({super.key, required this.changeLanguage});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  String requestType = MyConstants.map;

  // ignore: prefer_typing_uninitialized_variables
  var firstCamera;

  late IosDeviceInfo iosInfo;

  @override
  void initState() {
    super.initState();
    setCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: MyConstants.myTransactions),
      drawer: const MyDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: SizeConfig().getScreenPadding(),
          child: BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Row(children: [
                  //       Transform.scale(
                  //         scale: SizeConfig.screenWidth! * .003,
                  //         child: Radio<String>(
                  //           activeColor: ColorManger.mainBlue,
                  //           value: MyConstants.map,
                  //           groupValue: requestType,
                  //           onChanged: (String? value) {
                  //             setState(() {
                  //               requestType = value!;
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //       horizontalSpacing(SizeConfig.screenWidth! * .01),
                  //       Text(
                  //         S.of(context).map,
                  //         style: TextStyles.blackBoldStyle(SizeConfig.fontSize4!),
                  //       ),
                  //       horizontalSpacing(SizeConfig.screenWidth! * .05),
                  //       Transform.scale(
                  //         scale: SizeConfig.screenWidth! * .003,
                  //         child: Radio<String>(
                  //           activeColor: ColorManger.mainBlue,
                  //           value: MyConstants.camera,
                  //           groupValue: requestType,
                  //           onChanged: (String? value) {
                  //             setState(() {
                  //               requestType = value!;
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //       horizontalSpacing(SizeConfig.screenWidth! * .01),
                  //       Text(S.of(context).camera,
                  //           style:
                  //               TextStyles.blackBoldStyle(SizeConfig.fontSize4!)),
                  //       horizontalSpacing(SizeConfig.screenWidth! * .05),
                  //       Transform.scale(
                  //         scale: SizeConfig.screenWidth! * .003,
                  //         child: Radio<String>(
                  //           activeColor: ColorManger.mainBlue,
                  //           value: MyConstants.mic,
                  //           groupValue: requestType,
                  //           onChanged: (String? value) {
                  //             setState(() {
                  //               requestType = value!;
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //       horizontalSpacing(SizeConfig.screenWidth! * .01),
                  //       Text(S.of(context).microfone,
                  //           style:
                  //               TextStyles.blackBoldStyle(SizeConfig.fontSize4!)),
                  //     ]),
                  //   ],
                  // ),
                  FutureBuilder<void>(
                    future: setCamera(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the camera is initialized, display the camera screen
                        return CameraScreen(camera: firstCamera);
                      } else if (snapshot.hasError) {
                        // If there's an error, display the error message
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        // Otherwise, display a loading indicator while waiting for the camera
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                  
                  const AudioScreen(),
                  const AttendanceScreen(),
                ],
              );
            },
          ),
        ),
      )),
    );
  }

  Future<void> setCamera() async {
    final cameras = await availableCameras();
    firstCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
  }
}
