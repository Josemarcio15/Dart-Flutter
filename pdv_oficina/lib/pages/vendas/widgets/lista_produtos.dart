import 'package:flutter/material.dart';
import '../../../services/produto_service.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({super.key});

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  int? indiceSelecionado;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cabeçalho fixo
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),

          child: Row(
            children: const [
              Expanded(
                child: Text(
                  "Nome",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Código",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Qtd",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Valor",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

        // Lista de produtos
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView.separated(
              itemCount: produtosMock.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final produto = produtosMock[index];
                final isSelected = indiceSelecionado == index;

                return InkWell(
                  onTap: () {
                    setState(() {
                      indiceSelecionado = index;
                    });
                  },
                  child: Container(
                    color: isSelected ? Colors.red[100] : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text(produto.nome)),
                        Expanded(child: Text(produto.codigo.toString())),
                        Expanded(child: Text(produto.qtd.toString())),
                        Expanded(child: Text(produto.valor.toStringAsFixed(2))),
                        Expanded(child: Text(produto.total.toStringAsFixed(2))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
