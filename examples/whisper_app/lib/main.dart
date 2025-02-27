// ignore_for_file: public_member_api_docs, use_build_context_synchronously, unnecessary_brace_in_string_interps

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

import 'package:whisper_app/core/core.dart';
import 'package:whisper_app/page/whisper/whisper.dart';
import 'package:flutter/material.dart';
import 'package:general_framework/flutter/loading/loading.dart';
import 'package:general_framework/flutter/ui/alert/core.dart';
import 'package:general_lib/extension/extension.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

void main() async {
  await WhisperAppClientFlutter.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: WhisperAppClientFlutter.generalLibFlutterApp,
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
  final LoadingGeneralFrameworkController loadingGeneralFrameworkController = LoadingGeneralFrameworkController(loadingText: "");
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

  Future<void> initialized() async {
    setState(() {
      isLoading = true;
    });
    await Future(() async {
      loadingGeneralFrameworkController.update(loadingText: "Starting Initialized App");
      await WhisperAppClientFlutter.initialized(
        context: context,
        onLoading: (text) {
          loadingGeneralFrameworkController.update(loadingText: text);
        },
      );
      loadingGeneralFrameworkController.update(loadingText: "Succes Initialized App");
    });
    setState(() {
      isLoading = false;
    });
  }

  String waitText({
    required Duration duration,
  }) {
    return "Please Wait: Have fun trying out the application made by general-developers :)\nDuration: ${duration.toLeft()}";
  }

  @override
  Future<void> refresh() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    dynamic result = await Future(() async {
      try {
        final Duration waitDuration = Duration(seconds: 10);
        final DateTime dateTimeExpired = DateTime.now().add(waitDuration);
        loadingGeneralFrameworkController.update(
          loadingText: waitText(duration: dateTimeExpired.difference(DateTime.now())),
        );
        while (true) {
          await Future.delayed(Duration(microseconds: 10));
          if (dateTimeExpired.isExpired()) {
            break;
          }
          loadingGeneralFrameworkController.update(
            loadingText: waitText(duration: dateTimeExpired.difference(DateTime.now())),
          );
        }
        loadingGeneralFrameworkController.update(loadingText: "Navigate To Whisper Speech To Text Page");
        return true;
      } catch (e) {
        return e;
      }
    });
    if (result == true) {
      context.navigator().pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return WhisperSpeechToTextPage();
          },
        ),
      );
    } else {
      context.showAlertGeneralFramework(
        alertGeneralFrameworkOptions: AlertGeneralFrameworkOptions(
          title: "Failed",
          builder: (context, alertGeneralFrameworkOptions) {
            return """
I don't know it seems like this is an error, please let the developer know:

${result}
"""
                .trim();
          },
        ),
      );
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.height, minWidth: context.width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              LoadingGeneralFrameworkWidget(
                loadingGeneralFrameworkController: loadingGeneralFrameworkController,
                loadingGeneralFrameworkType: LoadingGeneralFrameworkType.widget,
              ),
              SizedBox(
                height: context.mediaQueryData.padding.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
