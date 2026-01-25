import 'dart:ui';
import 'package:flutter/material.dart';

///
/// Cabeçalho apresentando as seções.
class Cabecalho extends StatefulWidget implements PreferredSizeWidget {
  const Cabecalho({super.key});

  @override
  State<Cabecalho> createState() => _CabecalhoState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CabecalhoState extends State<Cabecalho> {
  String selectedSection = 'Sobre';
  final List sections = ['Sobre', 'Habilidades', 'Projetos', 'Experiências'];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(),
        ),
      ),
      title: Text(
        '</daniel>',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 24),
      actions: [
        // IconButton(
        //   icon: const Icon(Icons.dark_mode),
        //   onPressed: () {
        //     final appThemes = context.read<AppThemes>();
        //     appThemes.mudarTema();
        //   },
        // ),
        ...sections.map(
          (section) => TextButton(
            onPressed: () {
              setState(() => selectedSection = section);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                section,
                style: TextStyle(
                  color: selectedSection == section ? Theme.of(context).primaryColor : null,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: FilledButton(
            onPressed: () {},
            child: const Text('Contato'),
          ),
        ),
      ],
    );
  }
}
