// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class ApplicationWhisperLibraryDatabase extends JsonScheme {
  /// Generated
  ApplicationWhisperLibraryDatabase(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "applicationWhisperLibraryDatabase", "whisper_model_path": "", "file_audio_path": ""};
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == applicationWhisperLibraryDatabase
  /// if same return true
  bool json_scheme_utils_checkDataIsSameBySpecialType() {
    return rawData["@type"] == defaultData["@type"];
  }

  /// check value data whatever do yout want
  bool json_scheme_utils_checkDataIsSameBuilder({
    required bool Function(Map rawData, Map defaultData) onResult,
  }) {
    return onResult(rawData["@type"], defaultData["@type"]);
  }

  /// create [ApplicationWhisperLibraryDatabase]
  /// Empty
  static ApplicationWhisperLibraryDatabase empty() {
    return ApplicationWhisperLibraryDatabase({});
  }

  /// Generated
  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
  String? get whisper_model_path {
    try {
      if (rawData["whisper_model_path"] is String == false) {
        return null;
      }
      return rawData["whisper_model_path"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set whisper_model_path(String? value) {
    rawData["whisper_model_path"] = value;
  }

  /// Generated
  String? get file_audio_path {
    try {
      if (rawData["file_audio_path"] is String == false) {
        return null;
      }
      return rawData["file_audio_path"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set file_audio_path(String? value) {
    rawData["file_audio_path"] = value;
  }

  /// Generated
  static ApplicationWhisperLibraryDatabase create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "applicationWhisperLibraryDatabase",
    String? whisper_model_path,
    String? file_audio_path,
  }) {
    // ApplicationWhisperLibraryDatabase applicationWhisperLibraryDatabase = ApplicationWhisperLibraryDatabase({
    final Map applicationWhisperLibraryDatabase_data_create_json = {
      "@type": special_type,
      "whisper_model_path": whisper_model_path,
      "file_audio_path": file_audio_path,
    };

    applicationWhisperLibraryDatabase_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (applicationWhisperLibraryDatabase_data_create_json.containsKey(key) == false) {
          applicationWhisperLibraryDatabase_data_create_json[key] = value;
        }
      });
    }
    return ApplicationWhisperLibraryDatabase(applicationWhisperLibraryDatabase_data_create_json);
  }
}
