import 'package:flutter/material.dart';
import 'package:portifolio_web/helper/constants.dart';
import 'package:portifolio_web/portifolio_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: kCorPrimaria),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: kCorPrimaria,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            foregroundColor: const Color.fromARGB(255, 39, 39, 39),
          ),
        ),
      ),
      home: PortifolioPage(),
    );
  }
}
