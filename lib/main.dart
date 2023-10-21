import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plants_ui_challenge/pages/init_page/init_page.dart';
import 'package:plants_ui_challenge/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Plants UI Challenge',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const InitPage(),
      );
}
