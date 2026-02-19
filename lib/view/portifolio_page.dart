import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart'; // Pacote para scroll suave
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/view/cabecalho/cabecalho.dart';
import 'package:portifolio_web/view/rodape/rodape.dart';
import 'package:portifolio_web/view/secoes/experiencias.dart';
import 'package:portifolio_web/view/secoes/habilidades.dart';
import 'package:portifolio_web/view/secoes/projetos_aplicativos.dart';
import 'package:portifolio_web/view/secoes/projetos_web.dart';
import 'package:portifolio_web/view/secoes/sobre.dart';

class PortifolioPage extends StatefulWidget {
  const PortifolioPage({super.key});

  @override
  State<PortifolioPage> createState() => _PortifolioPageState();
}

class _PortifolioPageState extends State<PortifolioPage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < kLarguraMobile;
    final double larguraGap = size.width < kLarguraMobile ? 70 : 60;

    return Scaffold(
      appBar: const Cabecalho(),
      body: WebSmoothScroll(
        controller: scrollController,
        scrollAnimationLength: 150,
        scrollSpeed: 1,
        curve: Curves.decelerate,
        child: SingleChildScrollView(
          controller: scrollController,
          physics: isMobile ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(larguraGap),
              Sobre(size: size),
              Gap(larguraGap),
              const Habilidades(),
              Gap(larguraGap),
              ProjetosAplicativos(isMobile: isMobile, size: size),
              Gap(larguraGap),
              ProjetosWeb(isMobile: isMobile, size: size),
              Gap(larguraGap),
              Experiencias(size: size),
              const Rodape(),
            ],
          ),
        ),
      ),
    );
  }
}
