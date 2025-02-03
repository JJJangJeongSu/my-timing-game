import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/game_manger.dart';
import 'package:myapp/screens/start_screen/start_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.juaTextTheme(),
      ),
    );
  }
}
