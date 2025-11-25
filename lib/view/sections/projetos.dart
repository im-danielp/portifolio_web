import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portifolio_web/controller/projetos_controller.dart';
import 'package:portifolio_web/model/projeto_model.dart';

class Projetos extends StatefulWidget {
  const Projetos({super.key});

  @override
  State<Projetos> createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  late final List<PageController> _controllers;
  late final List<Timer> _timers;
  late final List _listaProjetos;
  final listaProjetos = ProjetosController.listaProjetos;

  @override
  void initState() {
    super.initState();
    _listaProjetos = ProjetosController.listaProjetos;
    _controllers = List.generate(_listaProjetos.length, (_) => PageController());
    _timers = List.generate(_listaProjetos.length, (i) {
      return Timer.periodic(const Duration(seconds: 5), (_) {
        final controller = _controllers[i];
        final images = _listaProjetos[i].images as List;
        if (!controller.hasClients || images.isEmpty) return;
        final current = (controller.page ?? controller.initialPage).round();
        final next = (current + 1) % images.length;
        controller.animateToPage(
          next,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        const SizedBox(height: 24),
        const Text('Projetos', style: TextStyle(fontWeight: FontWeight.bold)),
        const Text(
          'Coleção de aplicativos e designs feitos sobre medida para desenvolvimento de softwares.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        // Apps.
        SizedBox(
          height: 550,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            scrollDirection: Axis.horizontal,
            children: [
              ..._listaProjetos.asMap().entries.map(
                (entry) {
                  final i = entry.key;
                  final ProjetoModel e = entry.value;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        // Imagens.
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.grey.shade300, width: 2),
                            ),
                          ),
                          child: PageView(
                            controller: _controllers[i],
                            scrollDirection: Axis.horizontal,
                            children: e.images.map<Widget>((image) => Image.asset(image)).toList(),
                          ),
                        ),
                        // Textos.
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                          width: 300,
                          child: Column(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: .stretch,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      e.tipo,
                                      textAlign: .right,
                                      style: TextStyle(fontSize: 12, color: primaryColor),
                                    ),
                                    Text(
                                      e.titulo,
                                      textAlign: .center,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      e.descricao,
                                      style: const TextStyle(height: 1.8),
                                    ),
                                  ],
                                ),
                              ),
                              // Tags.
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  ...e.tags.map(
                                    (e) => Chip(
                                      label: Text(
                                        e,
                                        style: TextStyle(color: primaryColor, fontSize: 12),
                                      ),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: primaryColor, width: 1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
