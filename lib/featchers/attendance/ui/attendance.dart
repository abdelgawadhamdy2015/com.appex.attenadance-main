import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/featchers/attendance/ui/attendance_screen.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/audio_screen.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/camera_screen.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class Attendance extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const Attendance({super.key, required this.changeLanguage});

  @override
  State<Attendance> createState() => AttendanceState();
}

class AttendanceState extends State<Attendance> {
  String requestType = MyConstants.map;

  late CameraDescription firstCamera;

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Transform.scale(
                      scale: SizeConfig.screenWidth! * .003,
                      child: Radio<String>(
                        activeColor: ColorManger.mainBlue,
                        value: MyConstants.map,
                        groupValue: requestType,
                        onChanged: (String? value) {
                          setState(() {
                            requestType = value!;
                          });
                        },
                      ),
                    ),
                    horizontalSpacing(SizeConfig.screenWidth! * .01),
                    Text(
                      S.of(context).map,
                      style: TextStyles.blackBoldStyle(SizeConfig.fontSize4!),
                    ),
                    horizontalSpacing(SizeConfig.screenWidth! * .05),
                    Transform.scale(
                      scale: SizeConfig.screenWidth! * .003,
                      child: Radio<String>(
                        activeColor: ColorManger.mainBlue,
                        value: MyConstants.camera,
                        groupValue: requestType,
                        onChanged: (String? value) {
                          setState(() {
                            requestType = value!;
                          });
                        },
                      ),
                    ),
                    horizontalSpacing(SizeConfig.screenWidth! * .01),
                    Text(S.of(context).camera,
                        style:
                            TextStyles.blackBoldStyle(SizeConfig.fontSize4!)),
                    horizontalSpacing(SizeConfig.screenWidth! * .05),
                    Transform.scale(
                      scale: SizeConfig.screenWidth! * .003,
                      child: Radio<String>(
                        activeColor: ColorManger.mainBlue,
                        value: MyConstants.mic,
                        groupValue: requestType,
                        onChanged: (String? value) {
                          setState(() {
                            requestType = value!;
                          });
                        },
                      ),
                    ),
                    horizontalSpacing(SizeConfig.screenWidth! * .01),
                    Text(S.of(context).microfone,
                        style:
                            TextStyles.blackBoldStyle(SizeConfig.fontSize4!)),
                  ]),
                ],
              ),
              if (requestType == MyConstants.mic)
                const AudioRecorderScreen()
              else if (requestType == MyConstants.map)
                AttendanceScreen(changeLanguage: widget.changeLanguage)
              else
                CameraScreen(
                  camera: firstCamera,
                )
            ],
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
