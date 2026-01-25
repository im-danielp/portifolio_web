import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/view/cabecalho/cabecalho.dart';
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
      appBar: const Cabecalho(),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: .stretch,
              children: [
                Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60),
                Sobre(constraints: constraints),
                Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60),
                const Habilidades(),
                Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60),
                const ProjetosAplicativos(),
                Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60),
                const ProjetosWeb(),
                Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60),
                Experiencias(constraints: constraints),
                const Rodape(),
              ],
            );
          },
        ),
      ),
    );
  }
}
