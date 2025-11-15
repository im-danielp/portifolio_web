import 'package:portifolio_web/model/projeto_model.dart';

class ProjetosController {
  static const List<ProjetoModel> listaProjetos = [
    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Blitz',
      descricao:
          'Aplicativo mobile Android voltado para inspeções de segurança em atividades de engenharia elétrica.\nFunções para acompanhamento de equipes em tempo real, inspeção de locais para receber a atividade e inspeções sobre condições dos alojamentos e dormitórios.\nO usuário responde ao check-list e insere evidêcia fotográfica em caso de reprovação podendo acompanhar observação textual.',
      tags: ['Flutter', 'SQFlite', 'API Reset', 'SQL', 'Figma', 'Git'],
      images: [
        'assets/projetos/blitz/menu.jpg',
        'assets/projetos/blitz/dinamica.jpg',
        'assets/projetos/blitz/respostas.jpg',
        'assets/projetos/blitz/pergunta_respondida.jpg',
        'assets/projetos/blitz/map.jpg',
        'assets/projetos/blitz/historico_viabilizacao.jpg',
        'assets/projetos/blitz/dormitorio.jpg',
      ],
    ),
  ];
}
