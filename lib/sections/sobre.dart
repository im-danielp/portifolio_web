import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              width: maxWidth > kLarguraMedia ? 400 : 350,
            ),
          ),
          SizedBox(
            width: maxWidth > kLarguraMedia ? 500 : 400,
            height: maxWidth > kLarguraMedia ? 400 : 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
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
                Padding(
                  padding: EdgeInsets.only(top: maxWidth > kLarguraMedia ? 100 : 32),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.flutter_dash)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.flutter_dash)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.flutter_dash)),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    spacing: 16,
                    children: [
                      FilledButton.icon(
                        icon: Icon(Icons.phone),
                        label: Text('Entrar em contato'),
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                        ),
                        onPressed: () {},
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
