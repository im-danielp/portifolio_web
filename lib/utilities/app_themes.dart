import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_web/controller/constants.dart';

class AppThemes extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void mudarTema() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Claro.
  static ThemeData light = ThemeData(
    primaryColor: kCorPrimaria,
    colorScheme:
        ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(kHashCorPrimaria, kCorPrimariaSwatch),
        ).copyWith(
          secondary: kCorSecundaria,
        ),
    textTheme: GoogleFonts.interTextTheme(),
    primaryTextTheme: GoogleFonts.interTextTheme(),
    scaffoldBackgroundColor: Colors.white,
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
  );

  // Escuro.
  static ThemeData dark = ThemeData(
    primaryColor: kCorPrimaria,
    brightness: Brightness.dark,
    colorScheme:
        ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(kHashCorPrimaria, kCorPrimariaSwatch),
          brightness: Brightness.dark,
        ).copyWith(
          secondary: kCorSecundaria,
          surface: const Color(0xFF1E1E1E),
        ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    primaryTextTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: const Color(0xFF121212),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: kCorPrimaria,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: kCorPrimaria,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: kCorPrimaria, width: 2),
        overlayColor: Colors.transparent,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        foregroundColor: const Color(0xFFE0E0E0),
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        overlayColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
