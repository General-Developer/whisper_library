// ignore_for_file: public_member_api_docs
//
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:general_framework/flutter/client/general_framework_client_flutter_app_directory.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:general_system_device/general_system_device_flutter.dart';
import 'package:whisper_library_dart/whisper_library_dart.dart';

class ExampleClientFlutter {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  static final GeneralSystemDeviceFlutter generalFlutter = GeneralSystemDeviceFlutter();
  static final GeneralFrameworkClientFlutterAppDirectory generalFrameworkClientFlutterAppDirectory = GeneralFrameworkClientFlutterAppDirectory();
  static final WhisperLibrary whisperLibrary = WhisperLibrary();

  static Future<File?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType? type,
    List<String>? allowedExtensions,
  }) async {
    final filePicker = await FilePicker.platform.pickFiles(
      dialogTitle: dialogTitle,
      initialDirectory: initialDirectory,
      allowCompression: false,
      allowMultiple: false,
      type: type?? FileType.custom,
      allowedExtensions:allowedExtensions?? [
        "bin",
      ],
    );

    if (filePicker == null) {
      return null;
    }

    final fileFirst = filePicker.files.firstOrNull;
    if (fileFirst == null) {
      return null;
    }
    return File(fileFirst.path ?? fileFirst.xFile.path);
  }
}
