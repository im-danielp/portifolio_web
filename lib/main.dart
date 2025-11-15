import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/view/portifolio_page.dart';

void main() {
  runApp(const Portifolio());
}

class Portifolio extends StatelessWidget {
  const Portifolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kCorPrimaria,
        colorScheme:
            ColorScheme.fromSwatch(
              primarySwatch: const MaterialColor(kHashCorPrimaria, kCorPrimariaSwatch),
            ).copyWith(
              secondary: kCorSecundaria,
            ),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        primaryTextTheme: GoogleFonts.interTextTheme(Theme.of(context).primaryTextTheme),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: kCorPrimaria,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
            side: const BorderSide(color: kCorPrimaria, width: 2),
            overlayColor: Colors.transparent,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            foregroundColor: const Color.fromARGB(255, 39, 39, 39),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(overlayColor: Colors.transparent),
        ),
      ),
      home: const SelectionArea(child: PortifolioPage()),
    );
  }
}
