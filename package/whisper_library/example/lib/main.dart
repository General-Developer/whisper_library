// ignore_for_file: public_member_api_docs

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

import 'package:example/core/core.dart';
import 'package:example/page/general_ai_speech_to_text/geneal_ai_speech_to_text.dart';
import 'package:flutter/material.dart';
import 'package:general_framework/flutter/widget/widget.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  generalFlutter.media_player.ensureInitialized();
  await generalFlutter.system_audio.ensureInitialized();
  await generalAiSpeechToText.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        return MaterialApp(
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: const MainApp(),
        );
      },
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with GeneralLibFlutterStatefulWidget {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ensureInitialized();
      await initialized();
      await refresh();
    });
  }

  Future<void> initialized() async {
    setState(() {
      isLoading = true;
    });
    await Future(() async {
      await generalFrameworkClientFlutterAppDirectory.ensureInitialized(
        context: context,
        onLoading: (text) {},
      );
    });
    setState(() {
      isLoading = false;
    });
  }

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

  Map transcribeToJson = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: appBarGlobalKey,
        title: Text("Example"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: context.height, minWidth: context.width),
            child: Column(
              children: [
                MenuContainerGeneralFrameworkWidget.lisTile(
                  context: context,
                  contentPadding: EdgeInsets.all(5),
                  title: "Speech To Text",
                  onTap: () {
                    handleFunction(
                      onFunction: (context, statefulWidget) {
                        context.navigator().push(MaterialPageRoute(
                          builder: (context) {
                            return SpeechToTextPage();
                          },
                        ));
                      },
                    );
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
    );
  }
}
