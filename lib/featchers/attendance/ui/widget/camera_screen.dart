import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';

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
          width: SizeConfig.screenHeight! * .2,
          height: SizeConfig.screenHeight! * .2,
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
        verticalSpacing(SizeConfig.screenHeight! * .01),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                if (kDebugMode) {
                  print("image pathe is ------------- ${image.path}");
                }
                _controller.pausePreview();
                context.read<AttendanceCubit>().imageFile = File(image.path);
                // يمكنك الآن حفظ الصورة أو معالجتها
              } catch (e) {
                //  print(e);
              }
            },
            child: const Icon(Icons.camera),
          ),
          horizontalSpacing(SizeConfig.screenWidth! * .03),
          ElevatedButton(
            onPressed: () async {
              if (_controller.value.isInitialized) {
                setState(() {
                  _controller.resumePreview();
                  _initializeControllerFuture = _controller.initialize();
                });
              }
            },
            child: const Icon(Icons.replay),
          ),
        ]),
        
      ],
    );
  }
}
