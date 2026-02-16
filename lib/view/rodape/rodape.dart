import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Rodape extends StatelessWidget {
  const Rodape({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(80),
          color: primaryColor,
          child: Column(
            children: [
              Text(
                'Vamos trabalhar juntos?',
                style: TextStyle(color: secondaryColor),
              ),
              const Gap(14),
              const Text(
                'Estou sempre aberto a discutir novos projetos, ideias criativas ou oportunidades para fazer parte da sua visão. Entre em contato!',
                textAlign: .center,
                style: TextStyle(color: Colors.white),
              ),
              const Gap(24),
              Row(
                mainAxisAlignment: .center,
                spacing: 16,
                children: [
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    icon: const Icon(Icons.email_outlined),
                    onPressed: () {},
                    label: const Text('E-mail'),
                  ),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    icon: Transform.flip(
                      flipX: true,
                      child: const Icon(Icons.phone_enabled_outlined),
                    ),
                    onPressed: () {},
                    label: const Text('E-mail'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32),
          color: const Color.fromRGBO(68, 21, 161, 1),
          child: const Center(
            child: Text(
              '© 2025 Daniel Pacheco Ferreira. Todos os direitos reservados.',
              textAlign: .center,
              style: TextStyle(color: Colors.white38),
            ),
          ),
        ),
      ],
    );
  }
}
