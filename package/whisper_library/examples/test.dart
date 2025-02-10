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
import 'dart:io';

// import 'package:whisper_library/core/general_ai_speech_to_text/io.dart';
import 'package:general_lib/general_lib.dart';
import 'package:whisper_library/whisper_library.dart';

String whisperModelPath = "/home/galaxeus/Documents/big-data/ai/whisper-ggml/ggml-large-v3-turbo.bin";

void main(List<String> args) async {
  print("start");
  whisperModelPath = "/home/galaxeus/Documents/big-data/ai/whisper-ggml/ggml-small.bin";
  final WhisperLibrary generalAiSpeechToText = WhisperLibrary(
    libraryWhisperPath: "../../native_lib/prebuilt/lib/libwhisper.so",

  );

  await generalAiSpeechToText.ensureInitialized();
  final isLoadedModel = generalAiSpeechToText.loadWhisperModel(
    whisperModelPath: whisperModelPath,
  );
  if (isLoadedModel == false) {
    exit(0);
  }
  File fileWav = File(
    "../../native_lib/lib/whisper.cpp/samples/jfk.wav",
    // "/home/galaxeus/.local/share/general_developer.u_whisper_library.example/record.wav",
  );
  for (var i = 0; i < 10; i++) {
    {
      await Future.delayed(Duration(seconds: 2));
      DateTime dateTime = DateTime.now();
      final result = await generalAiSpeechToText.transcribeToJson(
        fileWav: fileWav,
        useCountProccecors: 1,
        useCountThread: (Platform.numberOfProcessors / 2).toInt(),
      );
      result["loop"] = i + 1;
      print("seconds: ${DateTime.now().difference(dateTime)}");
      result.printPretty();
    }
  }
  exit(0);
}
