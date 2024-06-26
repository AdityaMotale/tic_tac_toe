import 'package:flutter/material.dart';

import 'views/home.view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) {
    //     if (!kIsWeb) {
    //       SystemChrome.setPreferredOrientations(
    //         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    //       );
    //     }

    //     return const MyApp();
    //   },
    // ),
    
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0C0C0C),
        ),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
