import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:ttech_attendance/featchers/attendance/data/repo/audio_repo.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioRepository audioRepository;
  File? recordedFile;

  AudioCubit(this.audioRepository) : super(const AudioState.initial());

  Future<void> uploadRecording() async {
    if (recordedFile == null) {
      emit(const AudioState.error(error: "No audio file recorded."));
      return;
    }

    try {
      emit(const AudioState.loading());
      final response = await audioRepository.uploadAudio(recordedFile!);
      emit(AudioState.success(response));
    } catch (e) {
      emit(AudioState.error(error: "Error uploading audio: $e"));
    }
  }

  Future<String> _getAudioFilePath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/audio.aac";
  }
}
