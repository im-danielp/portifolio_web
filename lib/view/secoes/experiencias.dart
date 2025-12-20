import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio_web/controller/experiencias_controller.dart';

/// Experiências profissionais.
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

    return Container(
      color: const Color.fromARGB(255, 250, 250, 250),
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.25),
      child: Column(
        children: [
          const Gap(54),
          const Text('Experiências', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
            'Minha jornada profissional no mundo da tecnologia e desenvolvimento de software.',
          ),
          const Gap(32),

          // Lista habilidades
          ...listaHabilidades.map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor),
              ),
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(e.funcao, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        e.periodo,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 156, 156, 156),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    e.empresa,
                    style: const TextStyle(color: Color.fromARGB(255, 156, 156, 156)),
                  ),
                  const Gap(15),
                  Text(e.descricao),
                  const Gap(25),

                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...e.tags.map(
                        (e) => Chip(
                          padding: const EdgeInsets.all(3),
                          label: Text(
                            e,
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey.shade400, width: 1.2),
                            borderRadius: BorderRadius.circular(7),
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
}
