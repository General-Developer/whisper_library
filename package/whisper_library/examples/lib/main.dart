// /* <!-- START LICENSE -->


// This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
// Social Media:

//    - Youtube: https://youtube.com/@Global_Corporation 
//    - Github: https://github.com/globalcorporation
//    - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

// All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

// If you wan't edit you must add credit me (don't change)

// If this Software / Program / Source Code has you

// Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

// Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

// Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
// Karena jika ada negosiasi harga kemungkinan

// 1. Software Ada yang di kurangin
// 2. Informasi tidak lengkap
// 3. Bantuan Tidak Bisa remote / full time (Ada jeda)

// Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

// jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
// Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


// <!-- END LICENSE --> */
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:general/flutter/flutter.dart';
// import 'package:whisper_library/core/text_to_speech/text_to_speech.dart';
// import 'package:general_lib_flutter/general_lib_flutter.dart';

// const GeneralFlutter generalFlutter = GeneralFlutter();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   generalFlutter.media_player.ensureInitialized();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GeneralLibFlutterAppMain(
//       generalLibFlutterApp: generalLibFlutterApp,
//       builder: (themeMode, lightTheme, darkTheme, widget) {
//         return MaterialApp(
//           themeMode: themeMode,
//           theme: lightTheme,
//           darkTheme: darkTheme,
//           debugShowCheckedModeBanner: false,
//           home: const TTSPage(),
//         );
//       },
//     );
//   }
// }

// class TTSPage extends StatefulWidget {
//   const TTSPage({super.key});

//   @override
//   State<TTSPage> createState() => _TTSPageState();
// }

// class _TTSPageState extends State<TTSPage> with GeneralLibFlutterStatefulWidget {
//   late final TextToSpeechWhisperLibrary textToSpeechWhisperLibrary = TextToSpeechWhisperLibrary(
//     pathDirectoryTemp: Directory.systemTemp.createTempSync().path,
//     pathLibrary: "libtts_whisper_library.so",
//   );
//   final TextEditingController _controller = TextEditingController(text: "Hello World");
//   bool _isPlaying = false;
//   late final GeneralLibraryPlayerControllerBase playerController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       ensureInitialized();
//       await refresh();
//     });
//   }

//   @override
//   void dispose() {
//     playerController.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   void ensureInitialized() {
//     // TODO: implement ensureInitialized
//     super.ensureInitialized();
//     playerController = generalFlutter.media_player.createPlayer(player_id: "player");
//   }

//   @override
//   Future<void> refresh() async {
//     if (isLoading) {
//       return;
//     }
//     setState(() {
//       isLoading = true;
//     });

//     await Future(() async {
//       final Directory directoryTemp = await Directory.systemTemp.createTemp();
//       final File dpModel = await Future(() async {
//         if (kDebugMode) {
//           return File(
//             "/home/galaxeus/Documents/github/general-developer/whisper_library/package/whisper_library/models/deep_phonemizer.onnx",
//           );
//         }
//         final assetData = await rootBundle.load('packages/whisper_library/models/deep_phonemizer.onnx');
//         final File model = File("${directoryTemp.path}/deep_phonemizer.onnx");
//         await model.writeAsBytes(Uint8List.view(assetData.buffer));
//         return model;
//       });

//       final File vitsModel = await Future(() async {
//         if (kDebugMode) {
//           return File(
//             "/home/galaxeus/Documents/github/general-developer/whisper_library/package/whisper_library/models/hfc_female.onnx",
//           );
//         }
//         final assetData = await rootBundle.load('packages/whisper_library/models/hfc_female.onnx');
//         final File model = File("${directoryTemp.path}/amy.onnx");
//         await model.writeAsBytes(Uint8List.view(assetData.buffer));
//         return model;
//       });
//       textToSpeechWhisperLibrary.ensureInitialized(
//         pathDeepPhonemizerModel: dpModel.path,
//         pathVitsModel: vitsModel.path,
//       );
//     });
//     setState(() {
//       isLoading = false;
//     });
//   }

//   void _generateAndPlaySpeech() async {
//     if (_isPlaying) {
//       return;
//     }
//     if (_controller.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter some text')));
//       return;
//     }

//     try {
//       setState(() {
//         _isPlaying = true;
//       });

//       final result = await textToSpeechWhisperLibrary.createSpeechAsync(text: _controller.text);
//       await playerController.open(GeneralLibraryPlayerMediaBase(result.uri.toFilePath()));

//       setState(() {
//         _isPlaying = false;
//       });
//     } catch (e) {
//       if (context.mounted) {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Text To Speech"),
//       ),
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(minHeight: context.height, minWidth: context.width),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   controller: _controller,
//                   maxLines: null,
//                   decoration: () {
//                     final border = OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         // color: context.theme.indicatorColor,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     );
//                     return InputDecoration(
//                       hintText: 'Enter text to speak',
//                       disabledBorder: border,
//                       border: border,
//                       errorBorder: border,
//                       enabledBorder: border,
//                       focusedBorder: border.copyWith(
//                         borderSide: BorderSide(
//                           color: context.theme.indicatorColor,
//                           width: 1.0,
//                         ),
//                       ),
//                       focusedErrorBorder: border,
//                     );
//                   }(),
//                 ),
//               ),
//               SizedBox(height: context.mediaQueryData.padding.bottom),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _generateAndPlaySpeech();
//         },
//         child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
//       ),
//     );
//   }
// }
