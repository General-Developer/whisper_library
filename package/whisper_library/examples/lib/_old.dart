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
// import 'package:flutter/material.dart';
// import 'package:whisper_library/babylon/babylon_tts.dart';
// import 'package:general/flutter/flutter.dart';
// import 'package:general_lib_flutter/general_lib_flutter.dart';

// const GeneralFlutter generalFlutter = GeneralFlutter();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Babylon.init();
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
//   Future<void> refresh() async {}

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

//       final result = await Babylon.tts(_controller.text);
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Text To Speech"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _controller,
//               decoration: const InputDecoration(
//                 hintText: 'Enter text to speak',
//                 disabledBorder: OutlineInputBorder(),
//                 border: OutlineInputBorder(),
//                 errorBorder: OutlineInputBorder(),
//                 enabledBorder: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(),
//                 focusedErrorBorder: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.multiline,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _generateAndPlaySpeech();
//               },
//               child: Text(_isPlaying ? 'Playing...' : 'Generate Speech'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
