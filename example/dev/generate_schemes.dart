import 'dart:io';
import 'package:general_lib/general_lib.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  final Directory directoryScheme = Directory(path.join(Directory.current.path, "lib", "scheme"));
  directoryScheme.generalLibUtilsDangerRecreate();

  await jsonToScripts(
    [
      {
        "@type": "applicationWhisperLibraryDatabase",
        "whisper_model_path": "",
        "file_audio_path": "",
      },
    ],
    directory: Directory(path.join(directoryScheme.path, "scheme")),
  );

  exit(0);
}
