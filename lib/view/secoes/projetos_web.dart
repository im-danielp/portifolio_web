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
  final functions = ProjetosController();

  @override
  void initState() {
    super.initState();
    _listaProjetos = ProjetosController.listaProjetos
        .where((e) => ['Web', 'Design'].contains(e.tipo))
        .toList();

    _controllers = List.generate(_listaProjetos.length, (_) => PageController());

    _timers = List.generate(_listaProjetos.length, (i) {
      return Timer.periodic(const Duration(seconds: 5), (_) {
        if (!mounted) return;
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 720;
        final double containerHeight = isMobile ? 580 : 550;

        return SizedBox(
          height: containerHeight,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 32,
              vertical: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: _listaProjetos.length,
            itemBuilder: (context, i) {
              final ProjetoModel e = _listaProjetos[i];
              final double cardWidth = isMobile ? constraints.maxWidth * 0.85 : 550;

              return Container(
                width: cardWidth,
                margin: const EdgeInsets.only(right: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- Seção da Imagem (Header) ---
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: SizedBox(
                        height: isMobile ? 220 : 250,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () => functions.visualizaFotos(context, e.images),
                              child: PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _controllers[i],
                                children: (e.images as List).map<Widget>((image) {
                                  return Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  );
                                }).toList(),
                              ),
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
                            const Positioned.fill(
                              child: Center(
                                child: IgnorePointer(
                                  child: Icon(
                                    Icons.zoom_in,
                                    color: Colors.white38,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // --- Corpo do Conteúdo ---
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.titulo,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(8),
                            Flexible(
                              child: Text(
                                e.descricao,
                                style: TextStyle(
                                  height: 1.5,
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                                maxLines: isMobile ? 6 : 7,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // --- Botão de Ação (Footer) ---
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: SizedBox(
                        height: 45,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.open_in_new_rounded, size: 18),
                          label: const Text('Acessar Projeto'),
                          onPressed: () {
                            if (e.url.isNotEmpty) {
                              web.window.open(e.url, '_blank');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
