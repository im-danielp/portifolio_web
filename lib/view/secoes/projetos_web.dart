import 'dart:async';
import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio_web/controller/projetos_controller.dart';
import 'package:portifolio_web/model/projeto_model.dart';

class ProjetosWeb extends StatefulWidget {
  const ProjetosWeb({super.key});

  @override
  State<ProjetosWeb> createState() => _ProjetosWebState();
}

class _ProjetosWebState extends State<ProjetosWeb> {
  late final List<PageController> _controllers;
  late final List<Timer> _timers;
  late final List _listaProjetos;
  final listaProjetos = ProjetosController.listaProjetos;

  @override
  void initState() {
    super.initState();
    _listaProjetos = ProjetosController.listaProjetos
        .where((e) => ['Web', 'Design'].contains(e.tipo))
        .toList();
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

    return SizedBox(
      height: 550,
      width: 500,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        scrollDirection: Axis.horizontal,
        children: [
          ..._listaProjetos.asMap().entries.map(
            (entry) {
              final i = entry.key;
              final ProjetoModel e = entry.value;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisSize: .max,
                  children: [
                    // Imagens.
                    SizedBox(
                      width: 550,
                      height: 300,
                      child: Stack(
                        children: [
                          PageView(
                            controller: _controllers[i],
                            scrollDirection: Axis.horizontal,
                            children: e.images
                                .map<Widget>((image) => Image.asset(image, fit: .cover))
                                .toList(),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                              ),
                              child: Text(
                                e.tipo,
                                textAlign: .right,
                                style: TextStyle(fontSize: 12, color: primaryColor),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Textos.
                    const Gap(15),
                    SizedBox(
                      width: 500,
                      child: Column(
                        crossAxisAlignment: .stretch,
                        spacing: 10,
                        children: [
                          Text(
                            e.titulo,
                            textAlign: .left,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            e.descricao,
                            style: const TextStyle(height: 1.8),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: .bottomCenter,
                        child: Container(
                          width: 500,
                          padding: const EdgeInsets.only(bottom: 18),
                          child: FilledButton.icon(
                            icon: const Icon(Icons.open_in_new_rounded),
                            label: const Text(
                              'Acessar',
                              style: TextStyle(fontSize: 13),
                            ),
                            onPressed: () {
                              web.window.open(e.url, '_blank');
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
