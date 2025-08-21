import 'package:flutter/material.dart';
import 'package:pdv_oficina/pages/vendas/widgets/lista_produtos.dart';
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.amber,
                          child: SizedBox(
                            height: 50,
                            child: Center(child: Text("CAIXA ABERTO")),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.white,
                          child: SizedBox(width: 700, child: ListaProdutos()),
                        ),
                        Container(
                          color: Colors.grey,
                          child: SizedBox(height: 400, width: 100),
                        ),
                        Container(
                          color: Colors.red,
                          child: SizedBox(height: 400, width: 100),
                        ),
                        Container(
                          color: Colors.lime,
                          child: SizedBox(height: 400, width: 300),
                        ),
                        Container(
                          color: Colors.blue,
                          child: SizedBox(height: 400, width: 300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
