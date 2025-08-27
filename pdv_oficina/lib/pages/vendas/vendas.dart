import 'package:flutter/material.dart';
import 'package:pdv_oficina/pages/vendas/widgets/busca_produtos.dart';
import 'package:pdv_oficina/pages/vendas/widgets/codigo_barras.dart';
import 'package:pdv_oficina/pages/vendas/widgets/label_teclas.dart';
import 'package:pdv_oficina/pages/vendas/widgets/lista_produtos.dart';
import 'package:pdv_oficina/pages/vendas/widgets/quantidade_itens.dart';
import 'package:pdv_oficina/pages/vendas/widgets/valor_produto.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.blue,
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
            Column(
              children: [
                //Widget Lista de Produtos
                Container(
                  margin: const EdgeInsets.all(8.0),
                  height: screenHeight * 0.8,
                  width: screenWidth * 0.4,
                  child: ListaProdutos(),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                //widget busca itens
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenWidth * 0.2,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SizedBox(
                              width: 800,
                              height: 500,
                              child: BuscaProdutos(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                //widget Codigo de Barras
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.2,
                  child: CodigoBarras(),
                ),
                SizedBox(height: 10),
                //widget quantidade de itens
                SizedBox(
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.1,
                  child: QuantidadeItens(),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.2,
                  child: ValorProduto(),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.01,
                  width: screenWidth * 0.10,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.2,
                  child: LabelTeclas(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
