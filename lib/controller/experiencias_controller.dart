import 'package:portifolio_web/model/experiencia_model.dart';

class ExperienciasController {
  static const List<ExperienciaModel> listaExperiencias = [
    ExperienciaModel(
      funcao: 'Desenvolvedor de sistemas web e mobile',
      empresa: 'Dolp Engenharia',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.',
      periodo: '12/2024 - Presente',
      tags: ['Flutter', 'Git', 'SQL', 'API', 'ScriptCase'],
    ),
    ExperienciaModel(
      funcao: 'Desenvolvedor de sistemas mobile',
      empresa: 'DataRey Sistemas',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. ',
      periodo: '08/2024 - 12/2024',
      tags: ['Flutter', 'Git', 'Figma', 'UI/UX'],
    ),
    ExperienciaModel(
      funcao: 'Supervisor suporte',
      empresa: 'DataRey Sistemas',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. ',
      periodo: '02/2023 - 08/2024',
      tags: ['Suporte', 'Gestão', 'Testes', 'Projetos', 'Documentação'],
    ),
    ExperienciaModel(
      funcao: 'Suporte técnico ',
      empresa: 'DataRey Sistemas',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. ',
      periodo: '02/2023 - 08/2024',
      tags: ['Atendimento', 'Treinamento', 'Testes', 'Análise'],
    ),
  ];
}
