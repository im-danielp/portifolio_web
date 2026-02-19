import 'package:flutter/material.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 20,
      ),
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
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
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
        Text(
          'Software Developer',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w900,
            fontSize: isMobile ? 28 : 36,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(SobreController controller, BuildContext context) {
    return Wrap(
      spacing: 18,
      runSpacing: 10,
      children: [
        _socialInkWell('assets/sobre/github_logo.png', () => controller.abrirPagina(0)),
        _socialInkWell('assets/sobre/linkedin_logo.jpg', () => controller.abrirPagina(1)),
        InkWell(
          onTap: () => controller.copiarEmail(context, size.width),
          hoverColor: Colors.transparent,
          child: const Icon(Icons.email, size: 28),
        ),
      ],
    );
  }

  Widget _socialInkWell(String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(asset, width: 28, height: 28, fit: BoxFit.cover),
      ),
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
