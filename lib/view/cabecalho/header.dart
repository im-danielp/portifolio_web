import 'package:flutter/material.dart';

///
/// Cabeçalho apresentando as seções.
class Cabecalho extends StatefulWidget {
  const Cabecalho({super.key});

  @override
  State<Cabecalho> createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  String selectedSection = 'Sobre';
  final List sections = ['Sobre', 'Habilidades', 'Projetos', 'Experiências'];

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: const Text('</>', style: TextStyle(fontSize: 16)),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 24),
      actions: [
        ...sections.map(
          (section) => TextButton(
            onPressed: () {
              setState(() => selectedSection = section);
            },
            child: Padding(
              padding: const EdgeInsetsGeometry.only(left: 18),
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
          padding: const EdgeInsetsGeometry.only(left: 18),
          child: FilledButton(
            onPressed: () {},
            child: const Text('Contato'),
          ),
        ),
      ],
    );
  }
}
