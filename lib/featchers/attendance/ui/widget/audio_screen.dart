import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  AudioScreenState createState() => AudioScreenState();
}

class AudioScreenState extends State<AudioScreen> {
  List<String> audios = [
    "ahmed attendance",
    "you are so cute",
    "look , this is a cat"
  ];
  String value = '';

  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  String? _filePath;
  double _currentPosition = 0;
  double _totalDuration = 0;

  @override
  void dispose() {
    _audioPlayer.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    final bool isPermissionGranted = await _recorder.hasPermission();
    if (!isPermissionGranted) {
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    // Generate a unique file name using the current timestamp
    String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filePath = '${directory.path}/$fileName';

    // Define the configuration for the recording
    const config = RecordConfig(
      // Specify the format, encoder, sample rate, etc., as needed
      encoder: AudioEncoder.aacLc, // For example, using AAC codec
      sampleRate: 44100, // Sample rate
      bitRate: 128000, // Bit rate
    );

    // Start recording to file with the specified configuration
    await _recorder.start(config, path: _filePath!);
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder.stop();
    setState(() {
      _isRecording = false;
    });
    context.read<AttendanceCubit>().audioFile = File(_filePath ?? "");
  }

  Future<void> _playRecording() async {
    if (_filePath != null) {
      await _audioPlayer.setFilePath(_filePath!);
      _totalDuration = _audioPlayer.duration?.inSeconds.toDouble() ?? 0;
      _audioPlayer.play();

      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position.inSeconds.toDouble();
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    value = (audios..shuffle()).first;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(textAlign: TextAlign.center, S.of(context).readSentance),
          Text(
            value,
            style: TextStyles.lightRedRegulerStyle(SizeConfig.fontSize4!),
          ),
          Icon(
            _isRecording ? Icons.mic : Icons.mic_none,
            size: SizeConfig.screenHeight! * .05,
            color: _isRecording ? Colors.red : Colors.blue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isRecording ? null : _startRecording,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManger.mutedBlue,
                ),
                child: Text(
                  S.of(context).record,
                  style: TextStyles.whiteBoldStyle(SizeConfig.fontSize3!),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRecording ? _stopRecording : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(S.of(context).stop,
                    style: TextStyles.whiteBoldStyle(SizeConfig.fontSize3!)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: !_isRecording ? _playRecording : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManger.mainBlue,
            ),
            child: Text(S.of(context).play,
                style: TextStyles.whiteBoldStyle(SizeConfig.fontSize3!)),
          ),
          Slider(
            activeColor: ColorManger.darkBlue,
            value: _currentPosition,
            max: _totalDuration,
            onChanged: (value) {
              setState(() {
                _currentPosition = value;
              });
              _audioPlayer.seek(Duration(seconds: value.toInt()));
            },
          ),
        ],
      ),
    );
  }
}
