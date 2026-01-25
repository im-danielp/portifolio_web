import 'package:flutter/material.dart';
import 'package:portifolio_web/model/habilidade_model.dart';

class HabilidadesController {
  static const listaHabilidades = [
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
}
