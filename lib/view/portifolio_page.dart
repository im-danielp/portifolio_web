import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio_web/view/header/header.dart';
import 'package:portifolio_web/controller/constants.dart';
import 'package:portifolio_web/view/sections/habilidades.dart';
import 'package:portifolio_web/view/sections/sobre.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              Header(),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              Sobre(constraints: constraints),
              SliverToBoxAdapter(child: Gap(constraints.maxWidth > kLarguraMedia ? 70 : 60)),
              Habilidades(constraints: constraints),
            ],
          );
        },
      ),
    );
  }
}
