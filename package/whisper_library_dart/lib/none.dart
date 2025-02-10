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
import 'dart:async';

import 'base.dart';

/// Check Out: https://www.youtube.com/@GENERAL_DEV
class WhisperLibrary extends WhisperLibraryBase {
  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  WhisperLibrary({
    super.libraryWhisperPath,
  });

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  bool loadWhisperModel(
      {String openVinoEncoderDevice = "CPU",
      required String whisperModelPath,
      bool isUseGpu = false,
      int gpuDevice = 0}) {
    // TODO: implement loadWhisperModel
    throw UnimplementedError();
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  Future<Map> transcribeToJson({
    required fileWav,
    bool isTranslate = false,
    String language = "auto",
    int useCountThread = 0,
    int useCountProccecors = 0,
  }) {
    // TODO: implement transcribeToJson
    throw UnimplementedError();
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  void close() {
    // TODO: implement close
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  final bool _isCrash = false;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  final bool _isDeviceSupport = false;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  bool isCrash() {
    return _isCrash;
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  bool isDeviceSupport() {
    if (_isCrash) {
      return false;
    }
    return _isDeviceSupport;
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  FutureOr<void> dispose() async {
    return;
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  FutureOr<void> ensureInitialized() async {
    return;
  }
}
