import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_text_button.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/audio_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/audio_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight! * .5,
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        verticalSpacing(SizeConfig.screenHeight! * .03),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FloatingActionButton(
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                if (kDebugMode) {
                  print("image pathe is ------------- ${image.path}");
                }
                _controller.pausePreview();
                // يمكنك الآن حفظ الصورة أو معالجتها
              } catch (e) {
                //  print(e);
              }
            },
            child: const Icon(Icons.camera),
          ),
          FloatingActionButton(
            onPressed: () async {
              if (_controller.value.isInitialized) {
                setState(() {
                  _initializeControllerFuture = _controller.initialize();
                });
              }

              // يمكنك الآن حفظ الصورة أو معالجتها
            },
            child: const Icon(Icons.replay),
          ),
        ]),
        verticalSpacing(SizeConfig.screenHeight! * .03),
        BlocBuilder<AudioCubit, AudioState>(
          builder: (context, state) {
            return AppButtonText(
              verticalPadding: SizeConfig.screenHeight! * .0,
              buttonHeight: SizeConfig.screenHeight! * .06,
              buttonWidth: SizeConfig.screenWidth! * .4,
              backGroundColor: ColorManger.mutedBlue,
              textStyle: TextStyles.whiteBoldStyle(SizeConfig.fontSize4!),
              butonText: S.of(context).send,
              borderRadius: 20.r,
              onPressed: () {},
            );
          },
        ),
      ],
    );
  }
}
