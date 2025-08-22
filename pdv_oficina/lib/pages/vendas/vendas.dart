import 'package:flutter/material.dart';
import 'package:pdv_oficina/pages/vendas/widgets/codigo_barras.dart';
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
      body: Container(
        color: const Color.fromARGB(255, 33, 159, 243),
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
                      // Widget Caixa Aberto
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 10),
                            borderRadius: BorderRadius.circular(12),
                          ),

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
                        // Widget Lista de Produtos
                        Container(
                          color: Colors.blue,
                          child: SizedBox(
                            width: 700,
                            height: 500,
                            child: ListaProdutos(),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Widget codigo de barras
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink, // cor do container
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: SizedBox(width: 200, child: CodigoBarras()),
                        ),
                        SizedBox(width: 10),
                        // Widget
                        Container(
                          color: Colors.blue,
                          child: SizedBox(height: 400, width: 100),
                        ),
                        // Widget
                        Container(
                          color: Colors.blue,
                          child: SizedBox(height: 400, width: 300),
                        ),
                        // Widget
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
