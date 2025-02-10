# Whisper Library
 
**Whisper Library** Is library for transcribe sound to wav

## Demo
 


[![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/powered.png)](https://www.youtube.com/@Global_Corporation)

## 📚️ Docs

1. [Documentation](https://youtube.com/@GENERAL_DEV)
2. [Youtube](https://youtube.com/@GENERAL_DEV)
3. [Telegram Support Group](https://t.me/DEVELOPER_GLOBAL_PUBLIC)
4. [Contact Developer](https://github.com/General-Developer) (check social media or readme profile github)

## 🔖️ Features

1. [x] 📱️ **Cross Platform** support (Device, Edge Severless functions)
2. [x] 📜️ **Standarization** Style Code
3. [x] ⌨️ **Cli** (Terminal for help you use this library or create project)
4. [x] 🔥️ **Api** (If you developer bot / userbot you can use this library without interact cli just add library and use 🚀️)
5. [x] 🧩️ **Customizable Extension** (if you want add extension so you can more speed up on development)
6. [x] ✨️ **Pretty Information** (user friendly for newbie)
 
## ❔️ Fun Fact

**This library 100%** use on every my create project (**App, Server, Bot, Userbot**)
 
## 📈️ Proggres
 
- **10-02-2025**
  Starting **Release Stable** With core Features

## Resources

1. [MODEL](https://huggingface.co/ggerganov/whisper.cpp/tree/main)

### 📥️ Install Library

1. **Dart**

```bash
dart pub add whisper_library_dart
```

2. **Flutter**

```bash
flutter pub add whisper_library_flutter
```

## 🚀️ Quick Start

Example Quickstart script minimal for insight you or make you use this library because very simple

```dart 

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
```

## Reference

1. [Azkadev-Whisper](https://github.com/azkadev/whisper)
  Original Idea and concept library + Developer Maintance this library
2. [Ggerganov-whisper.cpp](https://github.com/ggerganov/whisper.cpp)
  ffi bridge main script so that this program can run