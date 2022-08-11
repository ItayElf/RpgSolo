import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpgsolo/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RpgSolo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.metamorphous(
              fontSize: 86, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.metamorphous(
              fontSize: 54, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: GoogleFonts.metamorphous(
              fontSize: 43, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.metamorphous(
              fontSize: 31, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: GoogleFonts.metamorphous(
              fontSize: 22, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.metamorphous(
              fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.metamorphous(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.metamorphous(
              fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.roboto(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}
