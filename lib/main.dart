import 'package:clock_app/views/screens/clock_page.dart';
import 'package:clock_app/views/screens/game_page.dart';
import 'package:clock_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';

//App initialization
void main() {
  //App execution
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: false,
        colorSchemeSeed: Colors.red,
      ),
      routes: {
        '/': (context) => const HomePage(),
        'game_page': (context) => const GamePage(),
        'clock_page': (context) => const ClockPage(),
      },
    );
  }
}
