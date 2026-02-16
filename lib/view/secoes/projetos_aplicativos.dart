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
  late final List<ProjetoModel> _listaProjetos;
  final functions = ProjetosController();

  @override
  void initState() {
    super.initState();
    _listaProjetos = ProjetosController.listaProjetos
        .where((e) => e.tipo == 'Aplicativo')
        .cast<ProjetoModel>()
        .toList();

    _controllers = List.generate(_listaProjetos.length, (_) => PageController());

    _initTimers();
  }

  void _initTimers() {
    _timers = List.generate(_listaProjetos.length, (i) {
      return Timer.periodic(const Duration(seconds: 5), (_) {
        if (!mounted) return;
        final controller = _controllers[i];
        final images = _listaProjetos[i].images;
        if (!controller.hasClients || images.isEmpty) return;

        final current = (controller.page ?? 0).round();
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
    for (var t in _timers) {
      t.cancel();
    }
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 700;

    return Column(
      children: [
        const SizedBox(height: 24),
        const Text('Projetos', style: TextStyle(fontWeight: FontWeight.bold)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Coleção de aplicativos e designs feitos sobre medida para desenvolvimento de softwares.',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: isMobile ? 650 : 550,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 20),
            scrollDirection: Axis.horizontal,
            itemCount: _listaProjetos.length,
            itemBuilder: (context, index) {
              final projeto = _listaProjetos[index];
              return Container(
                width: isMobile ? size.width * 0.85 : 550,
                margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Área da Imagem
                    Expanded(
                      flex: isMobile ? 3 : 2,
                      child: constroiImagens(projeto, index, isMobile, primaryColor),
                    ),
                    // Área de Conteúdo
                    Expanded(
                      flex: isMobile ? 4 : 3,
                      child: constroiTextos(projeto, primaryColor, isMobile),
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

  Widget constroiImagens(ProjetoModel projeto, int index, bool isMobile, Color primaryColor) {
    return InkWell(
      onTap: () => functions.visualizaFotos(context, projeto.images),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMobile ? 12 : 8),
              topRight: Radius.circular(isMobile ? 12 : 0),
              bottomLeft: Radius.circular(isMobile ? 0 : 8),
            ),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controllers[index],
              itemCount: projeto.images.length,
              itemBuilder: (context, i) => Image.asset(
                projeto.images[i],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Icon(Icons.zoom_in, color: Colors.white60, size: 40),
          ),
          Visibility(
            visible: isMobile,
            child: Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                ),
                child: Text(
                  projeto.tipo,
                  textAlign: .right,
                  style: TextStyle(fontSize: 12, color: primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget constroiTextos(ProjetoModel projeto, Color primaryColor, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: !isMobile,
            child: Text(
              projeto.tipo,
              textAlign: .right,
              style: TextStyle(fontSize: 12, color: primaryColor),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            projeto.titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                projeto.descricao,
                style: const TextStyle(height: 1.5, fontSize: 14, color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: projeto.tags.map((tag) => constroiTags(tag, primaryColor)).toList(),
          ),
        ],
      ),
    );
  }

  Widget constroiTags(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }
}
