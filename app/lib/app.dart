import 'package:fiesta_system/fiesta_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/game_page.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);

    return MaterialApp(
      title: 'Game Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: FiestaSystem.lightColorScheme,
        textTheme: GoogleFonts.sourceCodeProTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: FiestaSystem.darkColorScheme,
        textTheme: GoogleFonts.sourceCodeProTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      themeMode: themeNotifier.currentThemeMode,
      home: const GamePage(),
    );
  }
}
