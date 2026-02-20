import 'package:portifolio_web/model/experiencia_model.dart';

class ExperienciasController {
  static const List<ExperienciaModel> listaExperiencias = [
    ExperienciaModel(
      funcao: 'Desenvolvedor de sistemas web e mobile',
      empresa: 'Dolp Engenharia',
      descricao: ''' 
Atuação no desenvolvimento mobile utilizando Dart e Flutter, com foco na construção de interfaces performáticas e consumo de APIs. 
Desenvolvimento e manutenção de API própria e integração com API Azure. 
Gerenciamento de banco de dados SQL, incluindo criação de consultas otimizadas, triggers e views. 
Manutenção de sistemas web utilizando PHP (ScriptCase) e controle de versionamento Git.
Participação ativa na coleta de requisitos e prototipação de telas utilizando Figma.
          ''',
      periodo: '12/2024 - Presente',
      tags: ['Flutter', 'Git', 'SQL', 'SQFlite', 'API', 'ScriptCase'],
    ),

    ExperienciaModel(
      funcao: 'Desenvolvedor de sistemas mobile',
      empresa: 'DataRey Sistemas',
      descricao: ''' 
Desenvolvimento de telas intuitivas para aplicações mobile, web e desktop, garantindo design amigável e funcional. 
Implementação de novas funcionalidades, correções e comunicação com APIs. 
Gerenciamento de estado e modularização de código, focando na organização e escalabilidade do projeto. 
Prototipação de interfaces no Figma e colaboração direta na análise de requisitos. 
      ''',
      periodo: '08/2024 - 12/2024',
      tags: ['Flutter', 'Git', 'Figma', 'UI/UX'],
    ),

    ExperienciaModel(
      funcao: 'Supervisor suporte',
      empresa: 'DataRey Sistemas',
      descricao: '''
Coordenação de equipe e testes de QA (Garantia de Qualidade) para validação de novas versões do software. 
Atuação estratégica em análise de parcerias, relações empresariais e tratativas com representantes. 
Elaboração de documentação técnica (manuais) e relatórios analíticos para suporte à decisão. 
      ''',
      periodo: '02/2023 - 08/2024',
      tags: ['Suporte', 'Gestão', 'Testes', 'Projetos', 'Documentação'],
    ),

    ExperienciaModel(
      funcao: 'Suporte técnico ',
      empresa: 'DataRey Sistemas',
      descricao: ''' 
Resolução de problemas técnicos via acesso remoto e treinamento de usuários na usabilidade do sistema. 
Execução de testes de validação de software e documentação de funcionalidades. 
      ''',
      periodo: '02/2023 - 08/2024',
      tags: ['Atendimento', 'Treinamento', 'Testes', 'Análise'],
    ),
  ];
}
