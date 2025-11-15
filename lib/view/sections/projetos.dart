import 'package:flutter/material.dart';
import 'package:portifolio_web/controller/projetos_controller.dart';

class Projetos extends StatelessWidget {
  const Projetos({super.key});

  @override
  Widget build(BuildContext context) {
    final listaProjetos = ProjetosController.listaProjetos;
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
        SizedBox(
          height: 500,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: .horizontal,
            children: [
              ...listaProjetos.map(
                (e) => Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: .horizontal,
                          children: [
                            ...e.images.map((e) => Image.asset(e)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: .stretch,
                        mainAxisSize: .min,
                        children: [
                          Text(e.tipo),
                          Text(e.descricao),
                          Wrap(
                            spacing: 8,
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
                                  padding: const EdgeInsets.all(6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
