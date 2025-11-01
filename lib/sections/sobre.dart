import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_web/helper/constants.dart';
import 'package:web/web.dart' as web;

class Sobre extends StatelessWidget {
  final BoxConstraints constraints;

  const Sobre({super.key, required this.constraints});

  // Abre uma nova página para a URL especificada.
  Future<void> abrirPagina(int index) async {
    const List<String> urls = [
      'https://github.com/im-danielp',
      'https://www.linkedin.com/in/daniel-pacheco-ferreira',
      'mailto:danielpfcont@gmail.com?subject=Entrevista%20de%20emprego',
      'https://api.whatsapp.com/send/?phone=%2B5562992980263&text=Ol%C3%A1+Daniel%21+Vi+seu+curr%C3%ADculo+e+gostaria+de+marcar+uma+entrevista+de+emprego+com+voc%C3%AA&type=phone_number&app_absent=0',
    ];

    web.window.open(urls[index], '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = constraints.maxWidth;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: maxWidth > kLarguraMedia ? 400 : 350,
        child: Row(
          spacing: 60,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(maxWidth > kLarguraMedia ? 40 : 30),
              child: Image.asset('assets/daniel_pacheco.jpg'),
            ),
            SizedBox(
              width: maxWidth > kLarguraMedia ? 500 : 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            'Daniel Pacheco Ferreira',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          'FullStack Developer',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also',
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 26),
                          child: Row(
                            spacing: 18,
                            children: [
                              InkWell(
                                onTap: () => abrirPagina(0),
                                borderRadius: BorderRadius.circular(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/github_logo.png',
                                    width: 26,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => abrirPagina(1),
                                borderRadius: BorderRadius.circular(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/linkedin_logo.jpg',
                                    width: 26,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => abrirPagina(2),
                                child: Icon(Icons.email),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            FilledButton.icon(
                              icon: Icon(Icons.phone),
                              label: Text('Entrar em contato'),
                              style: FilledButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                              ),
                              onPressed: () => abrirPagina(4),
                            ),
                            OutlinedButton.icon(
                              icon: Icon(Icons.assignment_ind_outlined),
                              label: Text('Ver currículo'),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
