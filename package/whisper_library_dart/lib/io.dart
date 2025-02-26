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
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

// import 'package:ffi_universe/ffi/wasm/wasm.dart';
import 'package:ffi_universe/ffi_universe.dart';
import 'package:general_ml/utils/utils.dart';

import 'base.dart';
import 'ffi/bindings.dart';

/// Check Out: https://www.youtube.com/@GENERAL_DEV
class WhisperLibrary extends WhisperLibraryBase {
  bool _isInIsolate = false;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  WhisperLibrary({String? libraryWhisperPath})
    : super(
        libraryWhisperPath:
            libraryWhisperPath ??
            WhisperLibraryBase.getLibraryWhisperPathDefault(),
      );

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static late final WhisperLibrarySharedBindingsByGeneralDeveloper
  _whisperLibraryDartSharedBindingsByGeneralDeveloper;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static Pointer<whisper_context> _whisperModelContext = nullptr;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static bool _isEnsureInitialized = false;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static String _openVinoEncoderDevice = "CPU";

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static String _whisperModelPath = "";

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static bool _isUseGpu = false;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  static int _gpuDevice = 0;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  Future<void> ensureInitialized() async {
    if (_isEnsureInitialized) {
      return;
    }
    try {
      _whisperLibraryDartSharedBindingsByGeneralDeveloper =
          WhisperLibrarySharedBindingsByGeneralDeveloper(
            await FFIUniverse.open(path: libraryWhisperPath),
          );
      _isDeviceSupport = true;
    } catch (e) {
      print(e);
      _isCrash = true;
    }

    _isEnsureInitialized = true;
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  bool _isCrash = false;

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  bool _isDeviceSupport = false;

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

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static void ggmlLogCallbackFunction(
    int level,
    Pointer<Char> text,
    Pointer<Void> userData,
  ) {
    // print(text.cast<Utf8>().toDartString());
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  bool loadWhisperModel({
    String openVinoEncoderDevice = "CPU",
    required String whisperModelPath,
    bool isUseGpu = false,
    int gpuDevice = 0,
  }) {
    {
      WhisperLibrary._openVinoEncoderDevice = openVinoEncoderDevice;
      WhisperLibrary._whisperModelPath = whisperModelPath;
      WhisperLibrary._isUseGpu = isUseGpu;
      WhisperLibrary._gpuDevice = gpuDevice;
    }
    if (_isInIsolate == false) {
      return true;
    }
    if (isDeviceSupport() == false || isCrash()) {
      return false;
    }
    final whisperModelPathNative =
        WhisperLibrary._whisperModelPath.toNativeUtf8().cast<Char>();
    {
      final whisperModelContext = WhisperLibrary._whisperModelContext;
      if (whisperModelContext != nullptr) {
        /// release memory
        _whisperLibraryDartSharedBindingsByGeneralDeveloper.whisper_free(
          whisperModelContext,
        );
      }
    }

    {
      WhisperLibrary._whisperLibraryDartSharedBindingsByGeneralDeveloper
          .whisper_log_set(
            Pointer.fromFunction(ggmlLogCallbackFunction),
            "log".toNativeUtf8().cast<Void>(),
          );
      WhisperLibrary._whisperLibraryDartSharedBindingsByGeneralDeveloper
          .ggml_log_set(
            Pointer.fromFunction(ggmlLogCallbackFunction),
            "log".toNativeUtf8().cast<Void>(),
          );
    }

    WhisperLibrary._whisperLibraryDartSharedBindingsByGeneralDeveloper
        .ggml_backend_load_all();

    final cparams =
        _whisperLibraryDartSharedBindingsByGeneralDeveloper
            .whisper_context_default_params();
    cparams.use_gpu = WhisperLibrary._isUseGpu;
    cparams.gpu_device = WhisperLibrary._gpuDevice;

    final whisperModelContext =
        _whisperLibraryDartSharedBindingsByGeneralDeveloper
            .whisper_init_from_file_with_params(
              whisperModelPathNative,
              cparams,
            );
    WhisperLibrary._whisperModelContext = whisperModelContext;
    if (whisperModelContext.address == 0) {
      _whisperLibraryDartSharedBindingsByGeneralDeveloper.whisper_free(
        whisperModelContext,
      );
      return false;
    }
    final openVinoEncoderDeviceNative =
        WhisperLibrary._openVinoEncoderDevice.toNativeUtf8().cast<Char>();
    _whisperLibraryDartSharedBindingsByGeneralDeveloper
        .whisper_ctx_init_openvino_encoder(
          whisperModelContext,
          nullptr,
          openVinoEncoderDeviceNative,
          nullptr,
        );
    return true;
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  Future<Map> transcribeToJson({
    required dynamic fileWav,
    bool isTranslate = false,
    String language = "auto",
    int useCountThread = 0,
    int useCountProccecors = 0,
  }) async {
    if (isDeviceSupport() == false || isCrash()) {
      return {"@type": "error", "message": "not_support"};
    }
    if (_isInIsolate == false) {
      // ignore: non_constant_identifier_names
      final dynamic file_wav = () {
        if (fileWav is File) {
          return fileWav.path;
        } else if (fileWav is String) {
          return fileWav;
        } else if (fileWav is List<int>) {
          return Uint8List.fromList(fileWav);
        } else if (fileWav is Uint8List) {
          return fileWav;
        }
        return "";
      }();
      final libraryWhisperPath = this.libraryWhisperPath;
      final String openVinoEncoderDevice =
          WhisperLibrary._openVinoEncoderDevice;
      final String whisperModelPath = WhisperLibrary._whisperModelPath;
      final bool isUseGpu = WhisperLibrary._isUseGpu;
      final int gpuDevice = WhisperLibrary._gpuDevice;
      return await Isolate.run(() async {
        final WhisperLibrary generalAiSpeechToText = WhisperLibrary(
          libraryWhisperPath: libraryWhisperPath,
        );
        generalAiSpeechToText._isInIsolate = true;
        await generalAiSpeechToText.ensureInitialized();
        generalAiSpeechToText.loadWhisperModel(
          openVinoEncoderDevice: openVinoEncoderDevice,
          whisperModelPath: whisperModelPath,
          isUseGpu: isUseGpu,
          gpuDevice: gpuDevice,
        );
        final result = generalAiSpeechToText.transcribeToJson(
          fileWav: file_wav,
          isTranslate: isTranslate,
          language: language,
          useCountProccecors: useCountProccecors,
          useCountThread: useCountThread,
          // keep ignre
          // isInIsolate: false,
        );
        await generalAiSpeechToText.dispose();
        return result;
      });
    }
    final whisperModelContext = WhisperLibrary._whisperModelContext;
    if (whisperModelContext == nullptr) {
      return {"@type": "error"};
    }
    final List<double> filePcm32 = GeneralMlUtils.wavToNumpyArraywavToNumpy(
      fileWav,
    );
    if (filePcm32.isEmpty) {
      return {"@type": "error"};
    }
    final pointerFilePcm32 = GeneralMlUtils.listToPointerFloat(filePcm32);
    if (_whisperLibraryDartSharedBindingsByGeneralDeveloper
            .whisper_is_multilingual(whisperModelContext) ==
        0) {
      language = "en";
      isTranslate = false;
    }
    int nThreads = () {
      if (useCountThread < 1) {
        return 4;
      }
      return useCountThread;
    }();
    int nProccecors = () {
      if (useCountProccecors < 1) {
        return (Platform.numberOfProcessors / 4).toInt();
      }
      return useCountProccecors;
    }();
    int maxContext = -1;
    final wparams = _whisperLibraryDartSharedBindingsByGeneralDeveloper
        .whisper_full_default_params(
          whisper_sampling_strategy.WHISPER_SAMPLING_GREEDY,
        );
    final languageNative = language.toNativeUtf8().cast<Char>();
    wparams.print_realtime = false;
    wparams.print_progress = false;
    wparams.print_timestamps = false;
    wparams.print_special = false;
    wparams.debug_mode = false;
    wparams.translate = isTranslate;
    wparams.language = languageNative;
    wparams.detect_language = false;
    wparams.n_threads = nThreads;
    wparams.debug_mode = false;
    wparams.n_max_text_ctx =
        (maxContext >= 0) ? maxContext : wparams.n_max_text_ctx;
    wparams.offset_ms = 0;
    wparams.duration_ms = 0;
    wparams.thold_pt = 0.01;
    wparams.max_len = 60;
    wparams.split_on_word = false;
    wparams.audio_ctx = 0;
    wparams.tdrz_enable = false; // [TDRZ]
    final promptNative = "".toNativeUtf8().cast<Char>();
    wparams.initial_prompt = promptNative;
    wparams.greedy.best_of = 2;
    wparams.beam_search.beam_size = -1;
    wparams.temperature = 0.00;
    wparams.no_speech_thold = 0.6;
    wparams.temperature_inc = 0.20;
    wparams.entropy_thold = 2.40;
    wparams.logprob_thold = -1.00;
    wparams.no_timestamps = false;
    wparams.token_timestamps = true;
    wparams.suppress_nst = true;
    final int resultInference = () {
      if (nProccecors > 1) {
        return WhisperLibrary
            ._whisperLibraryDartSharedBindingsByGeneralDeveloper
            .whisper_full_parallel(
              whisperModelContext,
              wparams,
              pointerFilePcm32,
              filePcm32.length,
              nProccecors,
            );
      }
      return WhisperLibrary._whisperLibraryDartSharedBindingsByGeneralDeveloper
          .whisper_full(
            whisperModelContext,
            wparams,
            pointerFilePcm32,
            filePcm32.length,
          );
    }();
    filePcm32.clear();
    if (resultInference != 0) {
      return {"@type": "error"};
    }
    final int nSegments = WhisperLibrary
        ._whisperLibraryDartSharedBindingsByGeneralDeveloper
        .whisper_full_n_segments(whisperModelContext);
    String result = "";
    for (int i = 0; i < nSegments; ++i) {
      final text = WhisperLibrary
          ._whisperLibraryDartSharedBindingsByGeneralDeveloper
          .whisper_full_get_segment_text(whisperModelContext, i);
      result += text.cast<Utf8>().toDartString();
    }

    final Map resultJson = {
      "@type": "whisperTranscribe",
      "task": wparams.translate ? "Translate" : "Transcribe",
      "language":
          WhisperLibrary._whisperLibraryDartSharedBindingsByGeneralDeveloper
              .whisper_lang_str_full(
                WhisperLibrary
                    ._whisperLibraryDartSharedBindingsByGeneralDeveloper
                    .whisper_full_lang_id(whisperModelContext),
              )
              .cast<Utf8>()
              .toDartString(),
      "duration": (filePcm32.length / WHISPER_SAMPLE_RATE).toStringAsFixed(0),
      "text": result.trim(),
    };

    return resultJson;
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  FutureOr<void> dispose() async {
    if (_isInIsolate == false) {
      return;
    }

    final whisperModelContext = WhisperLibrary._whisperModelContext;
    if (whisperModelContext != nullptr) {
      WhisperLibrary._whisperLibraryDartSharedBindingsByGeneralDeveloper
          .whisper_free(whisperModelContext);
    }
  }

  /// Check Out: https://www.youtube.com/@GENERAL_DEV
  @override
  FutureOr<void> initialized() async {
    return;
  }
}
