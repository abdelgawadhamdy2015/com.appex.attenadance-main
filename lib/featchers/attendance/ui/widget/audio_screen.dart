import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/audio_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/audio_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class AudioRecorderScreen extends StatefulWidget {
  const AudioRecorderScreen({super.key});

  @override
  AudioRecorderScreenState createState() => AudioRecorderScreenState();
}

class AudioRecorderScreenState extends State<AudioRecorderScreen> {
  List<String> audios = [
    "ahmed attendance",
    "you are so cute",
    "look , this is a cat"
  ];

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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textAlign: TextAlign.center, S.of(context).readSentance),
            Text(
              (audios..shuffle()).first,
              style: TextStyles.lightRedRegulerStyle(SizeConfig.fontSize3!),
            ),
            Icon(
              _isRecording ? Icons.mic : Icons.mic_none,
              size: 100,
              color: _isRecording ? Colors.red : Colors.blue,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRecording ? null : _startRecording,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(S.of(context).record),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRecording ? _stopRecording : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(S.of(context).stop),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !_isRecording ? _playRecording : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(S.of(context).play),
            ),
            Slider(
              value: _currentPosition,
              max: _totalDuration,
              onChanged: (value) {
                setState(() {
                  _currentPosition = value;
                });
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            BlocBuilder<AudioCubit, AudioState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: _isRecording ? _sendRecording : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManger.checkBoxGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(S.of(context).send),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendRecording() async {}
}
