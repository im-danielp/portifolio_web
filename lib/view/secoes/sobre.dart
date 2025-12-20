import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/controller/sobre_controller.dart';

class Sobre extends StatelessWidget {
  final BoxConstraints constraints;

  const Sobre({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final controller = SobreController();
    final maxWidth = constraints.maxWidth;

    return SizedBox(
      height: maxWidth > kLarguraMedia ? 400 : 350,
      child: Row(
        spacing: 60,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem e textos.
          ClipRRect(
            borderRadius: BorderRadius.circular(maxWidth > kLarguraMedia ? 40 : 30),
            child: Image.asset('assets/sobre/daniel_pacheco.jpg'),
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
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
                      const Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),

                // Ícones e ações.
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Row(
                          spacing: 18,
                          children: [
                            InkWell(
                              onTap: () => controller.abrirPagina(0),
                              borderRadius: BorderRadius.circular(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/sobre/github_logo.png',
                                  width: 26,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.abrirPagina(1),
                              borderRadius: BorderRadius.circular(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/sobre/linkedin_logo.jpg',
                                  width: 26,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.copiarEmail(context, constraints.maxWidth),
                              child: const Icon(Icons.email),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          FilledButton.icon(
                            icon: const Icon(Icons.phone),
                            label: const Text('Entrar em contato'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                            ),
                            onPressed: () => controller.abrirPagina(3),
                          ),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.assignment_ind_outlined),
                            label: const Text('Ver currículo'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                            ),
                            onPressed: () async => controller.abrirCurriculo(),
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
    );
  }
}
