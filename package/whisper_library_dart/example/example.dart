import 'dart:io';
import 'package:general_lib/general_lib.dart';
import 'package:whisper_library_dart/whisper_library_dart.dart';

void main(List<String> args) async {
  print("start");
  String whisperModelPath = "path_to_file/ggml-small.bin";
  final WhisperLibrary generalAiSpeechToText = WhisperLibrary(
    libraryWhisperPath: "path_to_file/libwhisper.so",
  );
  await generalAiSpeechToText.ensureInitialized();
  final isLoadedModel = generalAiSpeechToText.loadWhisperModel(
    whisperModelPath: whisperModelPath,
  );
  if (isLoadedModel == false) {
    print("cant loaded");
    exit(1);
  }
  File fileWav = File(
    "path_to_file_sound/jfk.wav",
  );
  await Future.delayed(Duration(seconds: 2));
  DateTime dateTime = DateTime.now();
  final result = await generalAiSpeechToText.transcribeToJson(
    fileWav: fileWav,
    useCountProccecors: 1,
    useCountThread: (Platform.numberOfProcessors / 2).toInt(),
  );
  print("seconds: ${DateTime.now().difference(dateTime)}");
  result.printPretty();
  exit(0);
}
