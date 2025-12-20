import 'package:flutter/material.dart';
import 'package:portifolio_web/model/habilidade_model.dart';

class Habilidades extends StatelessWidget {
  const Habilidades({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    const List<HabilidadeModel> habilidades = [
      HabilidadeModel(
        icone: Icons.phone_iphone,
        titulo: 'Desenvolvimento Mobile',
        descricao: 'Experiência Flutter e desenvolvimento para dispositivos Android/iOS',
      ),
      HabilidadeModel(
        icone: Icons.data_object_rounded,
        titulo: 'Backend & APIs',
        descricao: 'Integração com APIs, manipulação de banco de dados SQL',
      ),
      HabilidadeModel(
        icone: Icons.format_paint_outlined,
        titulo: 'UI/UX Design',
        descricao: 'Design de interfaces intuitivas e experiências de usuário otimizadas',
      ),
    ];

    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: const Color.fromARGB(255, 250, 250, 250),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Habilidades & Expertise',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'Domínio em diversas tecnologias e frameworks para desenvolvimento de aplicações móveis e web de alta qualidade.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            runSpacing: 30,
            spacing: 15,
            children: [
              ...habilidades.map(
                (e) => Container(
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          e.icone,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(e.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 28),
                      Text(e.descricao, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
