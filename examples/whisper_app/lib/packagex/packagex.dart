// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

/// AutoGenerateBy Packagex
class PackagexProjectWhisperApp {
/// AutoGenerateBy Packagex
  static bool isSame({
    required String data
  }) {
    return [default_data_to_string, json.encode(default_data)].contains(data);
  }
/// AutoGenerateBy Packagex
    static String get default_data_to_string {
      return (JsonEncoder.withIndent(" " * 2).convert(default_data));
    }
/// AutoGenerateBy Packagex
    static Map get default_data {
return {
  "name": "whisper_app",
  "description": "A new Flutter project.",
  "publish_to": "none",
  "version": "1.0.0+1",
  "repository": "https://github.com/General-Developer/whisper_library",
  "homepage": "https://www.youtube.com/@general_dev",
  "issue_tracker": "https://t.me/DEVELOPER_GLOBAL_PUBLIC",
  "documentation": "https://www.youtube.com/@general_dev",
  "funding": [
    "https://github.com/sponsors/General-Developer",
    "https://github.com/sponsors/azkadev",
    "https://github.com/sponsors/generalfoss",
    "https://github.com/sponsors/general-developer"
  ],
  "project": {
    "type": ""
  }
};
    }

}