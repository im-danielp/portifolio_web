import 'package:flutter/material.dart';
import 'package:portifolio_web/helper/constants.dart';

class Sobre extends StatelessWidget {
  final BoxConstraints constraints;

  const Sobre({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final maxWidth = constraints.maxWidth;
    // final maxHeight = constraints.maxHeight;

    return SliverToBoxAdapter(
      child: Row(
        spacing: 60,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(maxWidth > kLarguraMedia ? 40 : 30),
            child: Image.asset(
              'assets/daniel_pacheco.jpg',
              width: maxWidth > kLarguraMedia ? 400 : 300,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
