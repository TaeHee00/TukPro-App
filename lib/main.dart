import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuk_pro_app/views/login.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TukPro",
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 232, 243, 252)),
        // textTheme: Theme.of(context).textTheme.apply(fontFamily: GoogleFonts.openSans().fontFamily)
      ),
      home: const LoginScreen(),
    );
  }
}
