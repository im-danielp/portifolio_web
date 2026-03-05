import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/controller/sobre_controller.dart';

class Sobre extends StatelessWidget {
  final Size size;

  const Sobre({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final controller = SobreController();
    final maxWidth = size.width;
    final bool isMobile = size.width < kLarguraMobile;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 20),
      height: isMobile ? null : (maxWidth > kLarguraMedia ? 450 : 400),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          // Seção da Imagem
          ClipRRect(
            borderRadius: BorderRadius.circular(isMobile ? 20 : 40),
            child: Image.asset(
              'assets/sobre/daniel_pacheco.jpg',
              width: isMobile ? 200 : 350,
              height: isMobile ? 200 : 350,
              fit: BoxFit.cover,
            ),
          ),
          if (!isMobile) const SizedBox(width: 60) else const SizedBox(height: 30),
          Flexible(
            flex: isMobile ? 0 : 1,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, isMobile),
                  const SizedBox(height: 15),
                  Text(
                    'Desenvolvedor dedicado a construir aplicações robustas e orientadas a dados. Com sólido domínio em modelagem de dados e arquitetura de sistemas, foco na entrega de produtos que equilibram performance técnica com usabilidade. Experiência no ciclo completo de desenvolvimento, garantindo soluções otimizadas para ambientes de alta demanda.',
                    textAlign: isMobile ? TextAlign.center : TextAlign.justify,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  _buildSocialIcons(controller, context),
                  const SizedBox(height: 20),
                  _buildActionButtons(controller, isMobile),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(3),
          ),
          child: const Text(
            'Daniel Pacheco Ferreira',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        DefaultTextStyle(
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w900,
            fontSize: isMobile ? 28 : 36,
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                'Software Developer',
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(SobreController controller, BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 10,
      children: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.github),
          onPressed: () => controller.abrirPagina(0),
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.linkedin),
          onPressed: () => controller.abrirPagina(1),
        ),
        IconButton(
          icon: const Icon(Icons.mail),
          onPressed: () => controller.copiarEmail(context, size.width),
        ),
      ],
    );
  }

  Widget _buildActionButtons(SobreController controller, bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        FilledButton.icon(
          icon: const Icon(Icons.phone),
          label: const Text('Entrar em contato'),
          onPressed: () => controller.abrirPagina(3),
          style: FilledButton.styleFrom(padding: const EdgeInsets.all(16)),
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.assignment_ind_outlined),
          label: const Text('Ver currículo'),
          onPressed: () => controller.abrirCurriculo(),
          style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
        ),
      ],
    );
  }
}
