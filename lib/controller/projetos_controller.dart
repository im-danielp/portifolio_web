import 'package:flutter/material.dart';
import 'package:portifolio_web/model/projeto_model.dart';

class ProjetosController {
  static const List<ProjetoModel> listaProjetos = [
    /// ================================================================================================= ///
    /// Projetos
    /// ================================================================================================= ///
    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Blitz',
      descricao:
          'Aplicativo mobile voltado para inspeções de segurança em atividades de engenharia elétrica. Funções para acompanhamento de equipes em tempo real, inspeção de locais para receber a atividade e inspeções sobre condições dos alojamentos e dormitórios. O usuário responde ao check-list e insere evidêcia fotográfica junto a uma observação textual.',
      images: [
        'assets/projetos/blitz/menu.jpg',
        'assets/projetos/blitz/dinamica.jpg',
        'assets/projetos/blitz/respostas.jpg',
        'assets/projetos/blitz/pergunta_respondida.jpg',
        'assets/projetos/blitz/map.jpg',
        'assets/projetos/blitz/historico_viabilizacao.jpg',
        'assets/projetos/blitz/dormitorio.jpg',
      ],
      tags: ['Flutter', 'SQFlite', 'API Rest', 'API Azure', 'SQL', 'Figma', 'Git'],
    ),

    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Sea Adventure',
      descricao:
          'Feito em colaboração com a equipe de robótica da escola SESI Aparecida de Goiânia, é um aplicativo de conscientização da fauna e flora marinha, apresentando curiosidades, eventos, peixes exóticos, guias e divulgação de ONGs que abordam esses temas.',
      images: [
        'assets/projetos/sea_adventure/vegetacao.jpeg',
        'assets/projetos/sea_adventure/cavalo_marinho.jpeg',
        'assets/projetos/sea_adventure/segredos_mar.jpeg',
        'assets/projetos/sea_adventure/drawer_sobre_oceano.jpeg',
        'assets/projetos/sea_adventure/estou_na_praia.jpeg',
        'assets/projetos/sea_adventure/oceanos.jpeg',
        'assets/projetos/sea_adventure/explore_oceano.jpeg',
        'assets/projetos/sea_adventure/peixe_bolha.jpeg',
        'assets/projetos/sea_adventure/mamiferos_aquaticos.jpeg',
        'assets/projetos/sea_adventure/belluga.jpeg',
      ],
      tags: ['Flutter', 'Figma', 'Git', 'UX'],
    ),

    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Datarey Mobile',
      descricao:
          'Usado para gestão empresarial dos clientes da empresa Datarey Sistemas, apresentando relatórios financeiros, cadastro de produtos, funcionários, clientes, acesso a filiais e outros controles importantes para administração empresarial.',
      images: [
        'assets/projetos/datarey_mobile/atualiza_dados_edit.png',
        'assets/projetos/datarey_mobile/atualiza_dados_fim.png',
        'assets/projetos/datarey_mobile/atualiza_dados.png',
        'assets/projetos/datarey_mobile/filiais.png',
        'assets/projetos/datarey_mobile/resumo_caixa_filtro.png',
        'assets/projetos/datarey_mobile/resumo_caixa.png',
      ],
      tags: ['Flutter', 'Figma', 'Git', 'UI/UX', 'VPN', 'Collections'],
    ),

    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Loja Virtual',
      descricao: 'descricao',
      images: [
        'assets/projetos/loja_virtual/drawer.png',
        'assets/projetos/loja_virtual/produtos_grid.png',
        'assets/projetos/loja_virtual/produtos_list.png',
        'assets/projetos/loja_virtual/tela_produto.png',
        'assets/projetos/loja_virtual/finalizar_compra.png',
        'assets/projetos/loja_virtual/meus_pedidos.png',
        'assets/projetos/loja_virtual/tela_lojas.png',
      ],
      tags: ['Flutter', 'Firebase', 'Git', 'Streams', 'NoSQL'],
    ),

    ProjetoModel(
      tipo: 'Aplicativo',
      titulo: 'Chat Online',
      descricao:
          'Aplicativo pra troca de mensagens de textos utilizando FireBase com o conceito de Stream do Flutter.\nUtiliza o Firebase como base de dados não relacional (documento) para armezenar as mensagens e dados de envio. É necessário logar com uma conta do Google, exigindo autenticação e coletando estes dados para identificação de usuários.',
      images: [
        'assets/projetos/chat_online/conversa_logado.jpeg',
        'assets/projetos/chat_online/conversa_deslogado.jpeg',
        'assets/projetos/chat_online/selecionar_conta.jpeg',
      ],
      tags: ['Flutter', 'Firebase', 'Auth', 'Stream', 'NoSQL'],
    ),

    /// ================================================================================================= ///
    /// Design
    /// ================================================================================================= ///
    ProjetoModel(
      tipo: 'Design',
      titulo: 'Blue Cat - Compras',
      descricao:
          'Pensado para ser um sistema web responsável por gerir as cotações e sugestões de compras de empresas. Possui etapas entre a sugestão e cotação final, sendo possível visualizar resumos, adicionar, remover e editar produtos, acompanhar dashboards, importar dados, cadastrar produtos, acessar histórico, níveis de acesso, e entre outras funcionalidades.',
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
      titulo: 'DataFarma - Fluxo de Vendas',
      descricao:
          'Reformulação do fluxo e tela de vendas do sistema Datafarma (Datarey Sistemas), adotando layouts mais modernos e simplificando os passos para realizar uma venda. O fluxo anterior realizava ações mediante combinação de teclas, já este fluxo novo visa deixar as opções mais visuais e intuitivas ao usuário, permitindo agilizar o processo de venda.',
      images: [
        'assets/projetos/datafarma_venda/sem_foco_1.jpg',
        'assets/projetos/datafarma_venda/lista_balconista.jpg',
        'assets/projetos/datafarma_venda/lista_cliente.jpg',
        'assets/projetos/datafarma_venda/seleciona_produto.jpg',
        'assets/projetos/datafarma_venda/sem_foco_2.jpg',
        'assets/projetos/datafarma_venda/recebimento.jpg',
        'assets/projetos/datafarma_venda/venda_finalizada.jpg',
        'assets/projetos/datafarma_venda/finalizar_como.jpg',
        'assets/projetos/datafarma_venda/mais_opcoes.jpg',
      ],
      url:
          'https://www.figma.com/design/ekLLNUSX5Hcfx9DxmXjcg3/Tela-de-vendas-DataFarma?node-id=0-1&t=ZKNEYtssN2LFN6ke-1',
    ),

    ProjetoModel(
      tipo: 'Design',
      titulo: 'Blue Cat - Dashboard',
      descricao:
          'Aplicação web para acompanhamento da empresa em tempo real, demonstrando seções de produtos com maiores vendas, percentual de venda em relação a metas, horários e dias com maior pico de vendas, resumo financeiro, lucro por produto, troca de filiais e outros.',
      images: [
        'assets/projetos/bluecat_dashboard/home.jpg',
        'assets/projetos/bluecat_dashboard/menu.jpg',
        'assets/projetos/bluecat_dashboard/cadastro.jpg',
        'assets/projetos/bluecat_dashboard/perfil.jpg',
      ],
      url:
          'https://www.figma.com/design/fpsHVe73G30fQ58LiSC600/BlueCat-Web---Gerenciamento?node-id=4-1371&t=opEHkWmceBORz191-1',
    ),

    ProjetoModel(
      tipo: 'Web',
      titulo: 'Portifolio Pessoal',
      descricao:
          'Inicialmente feito no Figma para brainstorm e organização das ideias iniciais, somente depois iniciado o desenvolvimento. Abaixo segue o link para o repositório no Git deste projeto.',
      images: [
        'assets/projetos/portifolio/sobre.png',
        'assets/projetos/portifolio/projetos.png',
        'assets/projetos/portifolio/experiencias.png',
      ],
      url: 'https://github.com/im-danielp/portifolio_web',
    ),
  ];

  ///
  /// ================================================================================================= ///
  /// Métodos
  /// ================================================================================================= ///
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
