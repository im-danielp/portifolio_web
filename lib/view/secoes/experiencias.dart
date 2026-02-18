import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/controller/experiencias_controller.dart';

class Experiencias extends StatelessWidget {
  final BoxConstraints constraints;

  const Experiencias({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final listaHabilidades = ExperienciasController.listaExperiencias;
    final primaryColor = Theme.of(context).primaryColor;
    final isMobile = constraints.maxWidth < kLarguraMobile;
    final double horizontalMargin = isMobile ? 16.0 : constraints.maxWidth * 0.25;

    return Container(
      color: const Color.fromARGB(255, 250, 250, 250),
      width: constraints.maxWidth,
      child: Column(
        children: [
          const Gap(54),
          const Text('Experiências', style: TextStyle(fontWeight: FontWeight.bold)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Minha jornada profissional no mundo da tecnologia e desenvolvimento de software.',
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(32),

          // Lista habilidades
          ...listaHabilidades.map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(funcao: e.funcao, periodo: e.periodo, isMobile: isMobile),
                  Text(
                    e.empresa,
                    style: const TextStyle(color: Color.fromARGB(255, 156, 156, 156)),
                  ),
                  const Gap(15),
                  Text(
                    e.descricao,
                    style: const TextStyle(height: 1.4),
                    textAlign: isMobile ? TextAlign.justify : TextAlign.start,
                  ),
                  const Gap(25),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...e.tags.map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Gap(64),
        ],
      ),
    );
  }

  /// Método auxiliar para construir o cabeçalho de forma responsiva.
  /// Evita que títulos longos quebrem o layout no mobile.
  Widget _buildHeader({required String funcao, required String periodo, required bool isMobile}) {
    final periodoWidget = Text(
      periodo,
      style: const TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 156, 156, 156),
      ),
    );

    final funcaoWidget = Text(
      funcao,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );

    if (isMobile) {
      // No Mobile: Empilha (Coluna)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          funcaoWidget,
          const Gap(4),
          periodoWidget,
        ],
      );
    } else {
      // No Desktop: Lado a Lado (Linha)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: funcaoWidget),
          const Gap(16),
          periodoWidget,
        ],
      );
    }
  }
}
