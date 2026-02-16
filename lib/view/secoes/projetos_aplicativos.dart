import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portifolio_web/controller/projetos_controller.dart';
import 'package:portifolio_web/model/projeto_model.dart';

class ProjetosAplicativos extends StatefulWidget {
  const ProjetosAplicativos({super.key});

  @override
  State<ProjetosAplicativos> createState() => _ProjetosAplicativosState();
}

class _ProjetosAplicativosState extends State<ProjetosAplicativos> {
  late final List<PageController> _controllers;
  late final List<Timer> _timers;
  late final List _listaProjetos;
  final functions = ProjetosController();

  @override
  void initState() {
    super.initState();
    _listaProjetos = ProjetosController.listaProjetos.where((e) => e.tipo == 'Aplicativo').toList();
    _controllers = List.generate(_listaProjetos.length, (_) => PageController());

    // Timer mantido exatamente como no original
    _timers = List.generate(_listaProjetos.length, (i) {
      return Timer.periodic(const Duration(seconds: 5), (_) {
        if (!mounted) return; // Segurança extra adicionada para evitar erros ao sair da tela
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
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 720; // Define o ponto de quebra

    return Column(
      children: [
        const SizedBox(height: 24),
        const Text('Projetos', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(
          child: Text(
            'Coleção de aplicativos e designs feitos sobre medida para desenvolvimento de softwares.',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        // Apps.
        SizedBox(
          // Ajusta a altura da lista: Mobile precisa de mais altura pois os elementos estão empilhados
          height: isMobile ? 620 : 550,
          child: ListView.builder(
            // Alterado para builder para melhor performance, mantendo visual
            padding: const EdgeInsets.symmetric(horizontal: 32),
            scrollDirection: Axis.horizontal,
            itemCount: _listaProjetos.length,
            itemBuilder: (context, i) {
              final ProjetoModel e = _listaProjetos[i];

              return Container(
                // No mobile, largura fixa menor. No desktop, largura automática baseada no conteúdo (Row)
                width: isMobile ? 300 : null,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors
                      .white, // Garante fundo branco para evitar transparência indesejada no mobile
                ),
                // Flex permite alternar entre Row e Column dinamicamente
                child: Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisSize: MainAxisSize.min, // Importante para não esticar demais
                  children: [
                    // --- Seção de Imagens ---
                    Tooltip(
                      message: 'Clique para expandir',
                      child: InkWell(
                        onTap: () => functions.visualizaFotos(context, e.images),
                        child: Stack(
                          children: [
                            Container(
                              // Desktop: Largura fixa 250, Altura segue o pai.
                              // Mobile: Largura total do card, Altura fixa 250 (quadrado).
                              width: isMobile ? double.infinity : 250,
                              height: isMobile
                                  ? 250
                                  : 548, // 548 compensa a borda para preencher altura
                              decoration: BoxDecoration(
                                border: isMobile
                                    ? Border(
                                        bottom: BorderSide(color: Colors.grey.shade300, width: 2),
                                      )
                                    : Border(
                                        right: BorderSide(color: Colors.grey.shade300, width: 2),
                                      ),
                              ),
                              child: PageView(
                                controller: _controllers[i],
                                scrollDirection: Axis.horizontal,
                                children: (e.images as List)
                                    .map<Widget>((image) => Image.asset(image, fit: BoxFit.cover))
                                    .toList(),
                              ),
                            ),
                            const Positioned.fill(
                              child: Center(
                                child: Icon(
                                  Icons.zoom_in,
                                  color: Color.fromARGB(66, 105, 42, 230),
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // --- Seção de Textos ---
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                      width: 300, // Mantém a largura original do bloco de texto
                      // No mobile, o Expanded faz o texto ocupar o resto da altura vertical disponível
                      height: isMobile ? null : 550,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              // spacing: 10, // Comentado: 'spacing' requer Flutter > 3.24. Usei SizedBox abaixo para compatibilidade garantida
                              children: [
                                Text(
                                  e.tipo,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 12, color: primaryColor),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  e.titulo,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  e.descricao,
                                  style: const TextStyle(height: 1.8),
                                  maxLines: isMobile
                                      ? 6
                                      : 10, // Limita linhas no mobile para não estourar
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          // Tags.
                          const SizedBox(height: 16), // Espaçamento extra
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...e.tags.map(
                                (t) => Chip(
                                  label: Text(
                                    t,
                                    style: TextStyle(color: primaryColor, fontSize: 12),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: primaryColor, width: 1.2),
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
        ),
      ],
    );
  }
}
