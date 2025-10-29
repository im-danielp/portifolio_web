import 'package:flutter/material.dart';
import 'package:portifolio_web/header/header.dart';
import 'package:portifolio_web/sections/sobre.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [Sobre()],
        ),
      ),
    );
  }
}
