import 'package:flutter/material.dart';
import 'package:portifolio_web/model/projeto_model.dart';

class ProjetosController {
  static const List<ProjetoModel> listaProjetos = [
    /// =========================================================================================================================================================== ///
    /// Projetos
    /// =========================================================================================================================================================== ///
    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Blitz',
      descricao:
          'Aplicativo mobile Android voltado para inspeções de segurança em atividades de engenharia elétrica.\nFunções para acompanhamento de equipes em tempo real, inspeção de locais para receber a atividade e inspeções sobre condições dos alojamentos e dormitórios.\nO usuário responde ao check-list e insere evidêcia fotográfica em caso de reprovação podendo acompanhar observação textual.',
      images: [
        'assets/projetos/blitz/menu.jpg',
        'assets/projetos/blitz/dinamica.jpg',
        'assets/projetos/blitz/respostas.jpg',
        'assets/projetos/blitz/pergunta_respondida.jpg',
        'assets/projetos/blitz/map.jpg',
        'assets/projetos/blitz/historico_viabilizacao.jpg',
        'assets/projetos/blitz/dormitorio.jpg',
      ],
      tags: ['Flutter', 'SQFlite', 'API Rest', 'SQL', 'Figma', 'Git'],
    ),

    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Sea Adventure',
      descricao:
          'Feito em colaboração com a equipe de robótica da escola SESI Aparecida de Goiânia, é um aplicativo de conscientização da fauna e flora marinha, apresentando curiosidades, eventos, peixes exóticos, guias e divulgação de ONGs que abordam esses temas.',
      images: [
        'assets/projetos/blitz/menu.jpg',
        'assets/projetos/blitz/dinamica.jpg',
        'assets/projetos/blitz/respostas.jpg',
        'assets/projetos/blitz/pergunta_respondida.jpg',
        'assets/projetos/blitz/map.jpg',
        'assets/projetos/blitz/historico_viabilizacao.jpg',
        'assets/projetos/blitz/dormitorio.jpg',
      ],
      tags: ['Flutter', 'Figma', 'Git', 'UX'],
    ),

    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Blitz',
      descricao:
          'Aplicativo mobile Android voltado para inspeções de segurança em atividades de engenharia elétrica.\nFunções para acompanhamento de equipes em tempo real, inspeção de locais para receber a atividade e inspeções sobre condições dos alojamentos e dormitórios.\nO usuário responde ao check-list e insere evidêcia fotográfica em caso de reprovação podendo acompanhar observação textual.',
      images: [
        'assets/projetos/blitz/menu.jpg',
        'assets/projetos/blitz/dinamica.jpg',
        'assets/projetos/blitz/respostas.jpg',
        'assets/projetos/blitz/pergunta_respondida.jpg',
        'assets/projetos/blitz/map.jpg',
        'assets/projetos/blitz/historico_viabilizacao.jpg',
        'assets/projetos/blitz/dormitorio.jpg',
      ],
      tags: ['Flutter', 'SQFlite', 'API Rest', 'SQL', 'Figma', 'Git'],
    ),

    /// =========================================================================================================================================================== ///
    /// Design
    /// =========================================================================================================================================================== ///
    ProjetoModel(
      tipo: 'Design',
      titulo: 'Blue Cat - Compras',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate. ',
      images: [
        'assets/projetos/bluecat_compras/login.jpg',
        'assets/projetos/bluecat_compras/home.png',
        'assets/projetos/bluecat_compras/resumo_diario.png',
        'assets/projetos/bluecat_compras/relatorios.png',
        'assets/projetos/bluecat_compras/sugestao_compra.png',
      ],
      url:
          'https://www.figma.com/design/nNxi7a0Ychy3MpWW2d4kvf/Compras-BlueCat?node-id=0-1&t=0fSlzxxDm6Xf6HNl-1',
    ),

    ProjetoModel(
      tipo: 'Design',
      titulo: 'Blue Cat - Compras',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate. ',
      images: [
        'assets/projetos/bluecat_compras/login.jpg',
        'assets/projetos/bluecat_compras/home.png',
        'assets/projetos/bluecat_compras/resumo_diario.png',
        'assets/projetos/bluecat_compras/relatorios.png',
        'assets/projetos/bluecat_compras/sugestao_compra.png',
      ],
      url:
          'https://www.figma.com/design/nNxi7a0Ychy3MpWW2d4kvf/Compras-BlueCat?node-id=0-1&t=0fSlzxxDm6Xf6HNl-1',
    ),

    ProjetoModel(
      tipo: 'Design',
      titulo: 'Blue Cat - Compras',
      descricao:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate. ',
      images: [
        'assets/projetos/bluecat_compras/login.jpg',
        'assets/projetos/bluecat_compras/home.png',
        'assets/projetos/bluecat_compras/resumo_diario.png',
        'assets/projetos/bluecat_compras/relatorios.png',
        'assets/projetos/bluecat_compras/sugestao_compra.png',
      ],
      url:
          'https://www.figma.com/design/nNxi7a0Ychy3MpWW2d4kvf/Compras-BlueCat?node-id=0-1&t=0fSlzxxDm6Xf6HNl-1',
    ),
  ];

  ///
  /// =========================================================================================================================================================== ///
  /// Métodos
  /// =========================================================================================================================================================== ///
  void visualizaFotos(BuildContext context, List<String> images) {
    showDialog(
      context: context,
      builder: (context) {
        final PageController pageController = PageController();
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return InteractiveViewer(
                          child: Image.asset(images[index], fit: BoxFit.contain),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 40),
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
