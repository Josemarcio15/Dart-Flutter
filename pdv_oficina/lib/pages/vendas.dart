import 'package:flutter/material.dart';
import 'package:pdv_oficina/shared/sidebar.dart';

class Vendas extends StatefulWidget {
  const Vendas({super.key});

  @override
  State<Vendas> createState() => _VendasState();
}

class _VendasState extends State<Vendas> {
  bool expandida = false;
  int indiceSelecionado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Vendas'),
        leading: IconButton(
          onPressed: () {
            setState(() {
              expandida = !expandida;
            });
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Container(
        color: Colors.green,
        child: Row(
          children: [
            Sidebar(
              indiceSelecionado: indiceSelecionado,
              expandida: expandida,
              aoSelecionarDestino: (index) {
                setState(() {
                  indiceSelecionado = index;
                });
              },
            ),
            Expanded(
              child: Container(color: Colors.blueGrey, child: Text('data')),
            ),
          ],
        ),
      ),
    );
  }
}
