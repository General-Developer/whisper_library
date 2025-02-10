/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// import 'dart:async';
// import 'dart:ffi';
// import 'dart:io';
// import 'package:ffi/ffi.dart';
// import 'package:general/core/general_core.dart';
// import 'package:general/core/player/player_controller.dart';
// import 'package:general/core/player/player_model_data.dart';
// import 'package:whisper_library_dart/babylon/src/bindings.dart';
// import "package:path/path.dart" as path;

// class TextToSpeechWhisperLibrary {
//   final Directory directoryTemp;
//   TextToSpeechWhisperLibrary({
//     required this.directoryTemp,
//   });
//   BabylonIo? _lib;

//   /// Getter for the Llama library.
//   ///
//   /// Loads the library based on the current platform.
//   BabylonIo get lib {
//     if (_lib == null) {
//       if (Platform.isWindows) {
//         _lib = BabylonIo(DynamicLibrary.open('tts_whisper_library_dart.dll'));
//       } else if (Platform.isLinux || Platform.isAndroid) {
//         _lib = BabylonIo(DynamicLibrary.open('/home/galaxeus/Documents/github/general-developer/whisper_library_dart/package/whisper_library_dart_flutter/linux/libtts_whisper_library_dart.so'));
//       } else if (Platform.isMacOS || Platform.isIOS) {
//         _lib = BabylonIo(DynamicLibrary.open('libtts_whisper_library_dart.dylib'));
//       } else {
//         throw Exception('Unsupported platform');
//       }
//     }
//     return _lib!;
//   }

//   Future<void> init() async {
//     final File dpModel = await Future(() async {
//       return File(
//         "/home/galaxeus/Documents/github/general-developer/whisper_library_dart/package/whisper_library_dart/models/deep_phonemizer.onnx",
//       );
//     });

//     final File vitsModel = await Future(() async {
//       return File(
//         "/home/galaxeus/Documents/github/general-developer/whisper_library_dart/package/whisper_library_dart/models/amy.onnx",
//       );
//     });

//     final dpModelPath = dpModel.path.toNativeUtf8().cast<Char>();
//     final language = "en_us".toNativeUtf8().cast<Char>();

//     final options = calloc<babylon_g2p_options_t>();
//     options.ref.language = language;
//     options.ref.use_dictionaries = 1;
//     options.ref.use_punctuation = 1;

//     final result = lib.babylon_g2p_init(dpModelPath, options.ref);

//     if (result != 0) {
//       throw Exception('Failed to initialize g2p');
//     }

//     final vitsModelPath = vitsModel.path.toNativeUtf8().cast<Char>();
//     final result2 = lib.babylon_tts_init(vitsModelPath);

//     if (result2 != 0) {
//       throw Exception('Failed to initialize tts');
//     }
//   }

//   File createSpeech({
//     required String text,
//   })  {
//     final File file = File(path.join(directoryTemp.path, "output.wav"));
//     if (file.parent.existsSync() == false) {
//       file.parent.createSync(recursive: true);
//     }
//     final textNative = text.toNativeUtf8().cast<Char>();
//     final outputNative=file.path.toNativeUtf8().cast<Char>();
//     lib.babylon_tts(textNative, outputNative);

//     malloc.free(textNative);
//     malloc.free(outputNative);

//     return file;
//   }

//   void dispose() {
//     lib.babylon_g2p_free();
//     lib.babylon_tts_free();
//   }
// }

// void main(List<String> args) async {
//   GeneralLibrary generalLibrary = GeneralLibrary();
//   final mediaPlayer = generalLibrary.media_player;
//   mediaPlayer.ensureInitialized();
//   final GeneralLibraryPlayerControllerBase playerController = mediaPlayer.createPlayer(player_id: "player");
//   final TextToSpeechWhisperLibrary textToSpeechWhisperLibrary = TextToSpeechWhisperLibrary(
//     directoryTemp: Directory(path.join(Directory.current.path, "temp")),
//   );

//   await textToSpeechWhisperLibrary.init();

//   final String text = "Hello World";
//   final result = textToSpeechWhisperLibrary.createSpeech(text: text);
//   print(result);

//   await playerController.open(GeneralLibraryPlayerMediaBase(result.uri.toFilePath()));
//   playerController.player.stream.completed.listen((complete) {
//     if (complete) {
//       exit(0);
//     }
//   });
//   // exit(0);
// }
