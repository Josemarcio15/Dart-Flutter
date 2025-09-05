// import 'package:flutter/material.dart';
// import '../../../services/product_service.dart';

// class ListaProdutos extends StatefulWidget {
//   const ListaProdutos({super.key});

//   @override
//   State<ListaProdutos> createState() => _ListaProdutosState();
// }

// class _ListaProdutosState extends State<ListaProdutos> {
//   int? indiceSelecionado;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Cabeçalho fixo
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(3),
//           ),

//           child: Row(
//             children: const [
//               Expanded(
//                 child: Text(
//                   "Nome",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   "Código",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   "Qtd",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   "Valor",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   "Total",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // Lista de produtos
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 255, 255, 255),
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: ListView.separated(
//               itemCount: produtosMock.length,
//               separatorBuilder: (context, index) => const Divider(height: 1),
//               itemBuilder: (context, index) {
//                 final produto = produtosMock[index];
//                 final isSelected = indiceSelecionado == index;

//                 return InkWell(
//                   onTap: () {
//                     setState(() {
//                       indiceSelecionado = index;
//                     });
//                   },
//                   child: Container(
//                     color: isSelected ? Colors.red[100] : null,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 8,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(child: Text(produto.nome)),
//                         Expanded(child: Text(produto.codigo.toString())),
//                         Expanded(child: Text(produto.qtd.toString())),
//                         Expanded(child: Text(produto.valor.toStringAsFixed(2))),
//                         Expanded(child: Text(produto.total.toStringAsFixed(2))),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pdv_oficina/services/produto_service.dart';

class Produto {
  final int id;
  final String nome;
  final int qtd;
  final double valor;

  Produto({
    required this.id,
    required this.nome,
    required this.qtd,
    required this.valor,
  });

  double get total => qtd * valor;
}

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({super.key});

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  int? indiceSelecionado;
  List<Produto> listaProdutos = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    try {
      final produtosDoBanco = await ServicoProduto.obterProdutos();
      setState(() {
        listaProdutos = produtosDoBanco;
        carregando = false;
      });
    } catch (e) {
      setState(() {
        carregando = false;
      });
      debugPrint("Erro ao carregar produtos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        // Cabeçalho fixo lista
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView.separated(
              itemCount: listaProdutos.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final produto = listaProdutos[index];
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
                        Expanded(child: Text(produto.id.toString())),
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
