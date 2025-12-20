import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio_web/view/cabecalho/header.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/view/rodape/rodape.dart';
import 'package:portifolio_web/view/secoes/experiencias.dart';
import 'package:portifolio_web/view/secoes/habilidades.dart';
import 'package:portifolio_web/view/secoes/projetos_aplicativos.dart';
import 'package:portifolio_web/view/secoes/projetos_web.dart';
import 'package:portifolio_web/view/secoes/sobre.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              const Cabecalho(),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              SliverToBoxAdapter(child: Sobre(constraints: constraints)),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              const SliverToBoxAdapter(child: Habilidades()),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              const SliverToBoxAdapter(child: ProjetosAplicativos()),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              const SliverToBoxAdapter(child: ProjetosWeb()),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              SliverToBoxAdapter(child: Experiencias(constraints: constraints)),
              const SliverToBoxAdapter(child: Rodape()),
            ],
          );
        },
      ),
    );
  }
}
