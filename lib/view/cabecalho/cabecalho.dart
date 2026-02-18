import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/controller/sobre_controller.dart';

class Cabecalho extends StatefulWidget implements PreferredSizeWidget {
  const Cabecalho({super.key});

  @override
  State<Cabecalho> createState() => _CabecalhoState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CabecalhoState extends State<Cabecalho> {
  String selectedSection = 'Sobre';
  final List<String> sections = ['Sobre', 'Habilidades', 'Projetos', 'Experiências'];
  final controller = SobreController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < kLarguraMobile;

    return AppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.7),
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: !isMobile,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(color: Colors.transparent),
        ),
      ),
      title: Text(
        '</daniel.pacheco>',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [
        Visibility(
          visible: isMobile,
          replacement: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Center(
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Contato'),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: FilledButton(
              onPressed: () => controller.abrirPagina(3),
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Contato'),
            ),
          ),
        ),
      ],
    );
  }
}
