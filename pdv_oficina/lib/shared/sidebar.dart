import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final int indiceSelecionado;
  final ValueChanged<int> aoSelecionarDestino;
  final bool expandida;

  const Sidebar({
    super.key,
    required this.indiceSelecionado,
    required this.aoSelecionarDestino,
    required this.expandida,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.grey,
      extended: expandida,
      selectedIndex: indiceSelecionado,
      onDestinationSelected: aoSelecionarDestino,
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text(' Home')),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_cart),
          label: Text('Venda'),
        ),
      ],
    );
  }
}
