import 'package:flutter/material.dart';
import 'package:portifolio_web/utilities/app_themes.dart';
import 'package:portifolio_web/view/portifolio_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppThemes(),
      child: const Portifolio(),
    ),
  );
}

class Portifolio extends StatelessWidget {
  const Portifolio({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemes = context.watch<AppThemes>();

    return ListenableBuilder(
      listenable: appThemes,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: appThemes.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SelectionArea(child: PortifolioPage()),
        );
      },
    );
  }
}
