// ignore_for_file: public_member_api_docs, use_build_context_synchronously, empty_catches

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

import 'package:example/core/core.dart';
import 'package:flutter/material.dart';
import 'package:general_audio/dart/general_audio/core/general_audio_recorder/general_audio_recorder.dart';
import 'package:general_framework/flutter/loading/loading_controller.dart';
import 'package:general_framework/flutter/loading/loading_core.dart';
import 'package:general_framework/flutter/widget/widget.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:general_system_device/core/core.dart';
import "package:path/path.dart" as path;

class WhisperSpeechToTextPage extends StatefulWidget {
  const WhisperSpeechToTextPage({super.key});

  @override
  State<WhisperSpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<WhisperSpeechToTextPage> with GeneralLibFlutterStatefulWidget {
  late final GeneralSystemDeviceLibraryPlayerControllerBase playerController;

  @override
  void initState() {
    //  initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ensureInitialized();
      await initialized();
      await refresh();
    });
  }

  @override
  void dispose() {
    try {
      playerController.stop();
    } catch (e) {}
    playerController.dispose();
    super.dispose();
  }

  @override
  void ensureInitialized() {
    //  ensureInitialized
    super.ensureInitialized();
    playerController = ExampleClientFlutter.generalFlutter.media_player.createPlayer(player_id: "player");
  }

  Future<void> initialized() async {
    setState(() {
      isLoading = true;
    });
    await Future(() async {
      final File fileModel = () {
        if (Dart.isLinux) {
          return File("../../../../big-data/whisper-ggml/ggml-small.bin");
        }
        return File(path.join(ExampleClientFlutter.generalFrameworkClientFlutterAppDirectory.app_support_directory.path, "ggml-small.bin"));
      }();
      final bool isLoadedModel = ExampleClientFlutter.whisperLibrary.loadWhisperModel(
        whisperModelPath: fileModel.path,
      );
      if (isLoadedModel == false) {
        context.showSnackBar("Model Cant Loaded");
      }
      setState(() {
        modelSize = fileModel.statSync().size;
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  int modelSize = 0;

  @override
  Future<void> refresh() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future(() async {});
    setState(() {
      isLoading = false;
    });
  }

  final File fileAudioRecord = () {
    return File(path.join(ExampleClientFlutter.generalFrameworkClientFlutterAppDirectory.app_support_directory.path, "record.wav"));
  }();

  Map transcribeFromExampleJFKToJson = {};

  Map transcribeFromRecordToJson = {};

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: valueGeneralAudioRecorder,
      builder: (context, child) {
        final GeneralAudioRecorder generalAudioRecorder = getGeneralAudioRecorder();

        return Scaffold(
          appBar: AppBar(
            key: appBarGlobalKey,
            title: Text(
              "Whisper Library - General Developer",
              style: context.theme.textTheme.titleLarge,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: context.height, minWidth: context.width),
                child: Column(
                  children: [
                    MenuContainerResponsiveGeneralFrameworkWidget(
                      isLoading: isLoading,
                      decorationBuilder: (context, decoration) {
                        return decoration.copyWith(
                          borderRadius: BorderRadius.circular(15),
                        );
                      },
                      titleBuilder: (context) {
                        return MenuContainerGeneralFrameworkWidget.title(
                          context: context,
                          title: "Information",
                        );
                      },
                      menuBuilder: (context) {
                        return [
                          MenuContainerGeneralFrameworkWidget.lisTile(
                            context: context,
                            contentPadding: EdgeInsets.all(5),
                            title: "Support",
                            trailing: Icon(
                              (ExampleClientFlutter.whisperLibrary.isDeviceSupport() == true) ? Icons.verified : Icons.close,
                            ),
                          ),
                          MenuContainerGeneralFrameworkWidget.lisTile(
                            context: context,
                            contentPadding: EdgeInsets.all(5),
                            title: "Record Audio",
                            trailing: Icon(
                              (ExampleClientFlutter.generalFlutter.system_audio.isSupport() == true) ? Icons.verified : Icons.close,
                            ),
                          ),
                          MenuContainerGeneralFrameworkWidget.lisTile(
                            context: context,
                            contentPadding: EdgeInsets.all(5),
                            title: "Model Size",
                            subtitle: FileSize.filesize(
                              size: modelSize,
                            ),
                          ),
                        ];
                      },
                    ),
                    MenuContainerResponsiveGeneralFrameworkWidget(
                      isLoading: isLoading,
                      decorationBuilder: (context, decoration) {
                        return decoration.copyWith(
                          borderRadius: BorderRadius.circular(15),
                        );
                      },
                      titleBuilder: (context) {
                        return MenuContainerGeneralFrameworkWidget.title(
                          context: context,
                          title: "Transcribe From Example JFK",
                        );
                      },
                      menuBuilder: (context) {
                        return [
                          MenuContainerGeneralFrameworkWidget.lisTile(
                            context: context,
                            contentPadding: EdgeInsets.all(5),
                            title: "Transcribe",
                            trailing: Icon(Icons.send),
                            onTap: () {
                              handleFunction(
                                onFunction: (context, statefulWidget) async {
                                  final File fileWav = File(
                                    () {
                                      if (Dart.isLinux) {
                                        return "../../../../native_lib/lib/whisper.cpp/samples/jfk.wav";
                                      }
                                      return path.join(ExampleClientFlutter.generalFrameworkClientFlutterAppDirectory.app_support_directory.path, "jfk.wav");
                                    }(),
                                  );
                                  if (fileWav.existsSync() == false) {
                                    context.showSnackBar("File: Not Found ${path.basename(fileWav.path)}");
                                    return;
                                  }
                                  transcribeFromExampleJFKToJson.clear();
                                  LoadingGeneralFrameworkController loadingGeneralFrameworkController = LoadingGeneralFrameworkController(loadingText: "");
                                  LoadingGeneralFramework.show(context: context, loadingGeneralFrameworkController: loadingGeneralFrameworkController);
                                  loadingGeneralFrameworkController.update(loadingText: "Transcribe...");
                                  DateTime dateTime = DateTime.now();
                                  try {
                                    transcribeFromExampleJFKToJson = await ExampleClientFlutter.whisperLibrary.transcribeToJson(
                                      fileWav: fileWav.path,
                                      useCountProccecors: 1,
                                      useCountThread: 4,
                                    );
                                    loadingGeneralFrameworkController.update(loadingText: "Transcribe Succes");
                                    context.navigator().pop();
                                    transcribeFromExampleJFKToJson["time"] = "seconds: ${DateTime.now().difference(dateTime).inSeconds}";
                                    setState(() {});
                                  } catch (e) {
                                    transcribeFromExampleJFKToJson = {"@type": "error", "message": "crash"};
                                    transcribeFromExampleJFKToJson["time"] = "seconds: ${DateTime.now().difference(dateTime).inSeconds}";
                                    setState(() {});
                                    context.showSnackBar("Error: $e");
                                    loadingGeneralFrameworkController.update(loadingText: "Transcribe Failed");
                                    context.navigator().pop();
                                  }
                                },
                              );
                            },
                          ),
                          if (transcribeFromExampleJFKToJson.isNotEmpty) ...[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                transcribeFromExampleJFKToJson.toStringifyPretty(),
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ];
                      },
                    ),
                    MenuContainerResponsiveGeneralFrameworkWidget(
                      isLoading: isLoading,
                      decorationBuilder: (context, decoration) {
                        return decoration.copyWith(
                          borderRadius: BorderRadius.circular(15),
                        );
                      },
                      titleBuilder: (context) {
                        return MenuContainerGeneralFrameworkWidget.title(
                          context: context,
                          title: "Transcribe From Record",
                        );
                      },
                      menuBuilder: (context) {
                        return [
                          MenuContainerGeneralFrameworkWidget.lisTile(
                            context: context,
                            contentPadding: EdgeInsets.all(5),
                            title: (generalAudioRecorder.isRecord) ? "Stop" : "Record",
                            trailing: Icon(
                              (generalAudioRecorder.isRecord) ? Icons.stop : Icons.mic,
                            ),
                            onTap: () {
                              handleFunction(
                                onFunction: (context, statefulWidget) async {
                                  if (generalAudioRecorder.isRecord) {
                                    await generalAudioRecorder.stop();
                                  } else {
                                    await generalAudioRecorder.start();
                                  }
                                  setState(() {});
                                },
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: playerController.player.stream.playing,
                            builder: (context, snapshot) {
                              final isPlaying = snapshot.data ?? false;
                              return MenuContainerGeneralFrameworkWidget.lisTile(
                                context: context,
                                contentPadding: EdgeInsets.all(5),
                                title: "Audio",
                                trailing: Icon(
                                  (isPlaying) ? Icons.stop : Icons.play_arrow,
                                ),
                                onTap: () {
                                  handleFunction(
                                    onFunction: (context, statefulWidget) async {
                                      if (isPlaying) {
                                        await playerController.player.stop();
                                      } else {
                                        await playerController.open(GeneralSystemDeviceLibraryPlayerMediaBase(fileAudioRecord.path));
                                      }
                                      // setState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          MenuContainerGeneralFrameworkWidget.lisTile(
                            context: context,
                            contentPadding: EdgeInsets.all(5),
                            title: "Transcribe",
                            trailing: Icon(Icons.send),
                            onTap: () {
                              handleFunction(
                                onFunction: (context, statefulWidget) async {
                                  final File fileWav = fileAudioRecord;

                                  if (fileWav.existsSync() == false) {
                                    context.showSnackBar("File: Not Found ${path.basename(fileWav.path)}");
                                    return;
                                  }
                                  transcribeFromRecordToJson.clear();
                                  LoadingGeneralFrameworkController loadingGeneralFrameworkController = LoadingGeneralFrameworkController(loadingText: "");
                                  LoadingGeneralFramework.show(context: context, loadingGeneralFrameworkController: loadingGeneralFrameworkController);
                                  loadingGeneralFrameworkController.update(loadingText: "Transcribe...");
                                  DateTime dateTime = DateTime.now();
                                  try {
                                    transcribeFromRecordToJson = await ExampleClientFlutter.whisperLibrary.transcribeToJson(
                                      fileWav: fileWav.path,
                                      useCountProccecors: 1,
                                      useCountThread: 4,
                                    );
                                    loadingGeneralFrameworkController.update(loadingText: "Transcribe Succes");
                                    context.navigator().pop();
                                    transcribeFromRecordToJson["time"] = "seconds: ${DateTime.now().difference(dateTime).inSeconds}";
                                    setState(() {});
                                  } catch (e) {
                                    transcribeFromRecordToJson = {"@type": "error", "message": "crash"};
                                    transcribeFromRecordToJson["time"] = "seconds: ${DateTime.now().difference(dateTime).inSeconds}";
                                    setState(() {});
                                    context.showSnackBar("Error: $e");
                                    loadingGeneralFrameworkController.update(loadingText: "Transcribe Failed");
                                    context.navigator().pop();
                                  }
                                },
                              );
                            },
                          ),
                          if (transcribeFromRecordToJson.isNotEmpty) ...[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                transcribeFromRecordToJson.toStringifyPretty(),
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ];
                      },
                    ),
                    SizedBox(
                      height: context.mediaQueryData.padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        );
      },
    );
  }

  ValueNotifier<GeneralAudioRecorder?> valueGeneralAudioRecorder = ValueNotifier(null);
  GeneralAudioRecorder getGeneralAudioRecorder() {
    GeneralAudioRecorder? generalAudioRecorder = valueGeneralAudioRecorder.value;
    if (generalAudioRecorder != null) {
      return generalAudioRecorder;
    }
    generalAudioRecorder = ExampleClientFlutter.generalFlutter.system_audio.generalAudio.createRecordOrGetRecord(
      outputRecordFilePath: fileAudioRecord.path,
      sampleRate: 16000,
      channels: 1,
    );
    valueGeneralAudioRecorder.value = generalAudioRecorder;
    return generalAudioRecorder;
  }
}
