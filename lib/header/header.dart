import 'package:flutter/material.dart';

///
/// Cabeçalho apresentando as seções.
class Header extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const Header({
    super.key,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String selectedSection = 'Sobre';
  final List sections = ['Sobre', 'Habilidades', 'Projetos', 'Experiências'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          elevation: 0.0,
          title: Text('</>', style: TextStyle(fontSize: 16)),
          actionsPadding: EdgeInsets.symmetric(horizontal: 24),
          actions: [
            ...sections.map(
              (section) => TextButton(
                onPressed: () {
                  setState(() => selectedSection = section);
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 18),
                  child: Text(
                    section,
                    style: TextStyle(
                      color: selectedSection == section ? Theme.of(context).primaryColor : null,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 18),
              child: FilledButton(
                onPressed: () {},
                child: Text('Contato'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
