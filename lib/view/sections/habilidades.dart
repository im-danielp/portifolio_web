import 'package:flutter/material.dart';
import 'package:portifolio_web/model/habilidade_model.dart';

class Habilidades extends StatelessWidget {
  final BoxConstraints constraints;

  const Habilidades({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final maxWidth = constraints.maxWidth;

    final List<HabilidadeModel> habilidades = [
      HabilidadeModel(
        icone: Icon(Icons.phone_iphone),
        titulo: 'Desenvolvimento Mobile',
        descricao: 'Experiência Flutter e desenvolvimento para dispositivos Android/iOS',
      ),
      HabilidadeModel(
        icone: Icon(Icons.data_object_rounded),
        titulo: 'Backend & APIs',
        descricao: 'Integração com APIs, manipulação de banco de dados SQL',
      ),
      HabilidadeModel(
        icone: Icon(Icons.format_paint_outlined),
        titulo: 'UI/UX Design',
        descricao: 'Design de interfaces intuitivas e experiências de usuário otimizadas',
      ),
    ];

    return SliverToBoxAdapter(
      child: Container(
        width: 200,
        height: 500,
        color: Colors.grey.shade100,
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...habilidades.map(
              (e) => Container(
                width: 350,
                // margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    e.icone,
                    SizedBox(height: 8),
                    Text(e.titulo, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(e.descricao),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
