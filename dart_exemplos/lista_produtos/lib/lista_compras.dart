import 'package:flutter/material.dart';

class Item {
  final String nome;
  int qtd;
  int cod;
  Item({required this.nome, required this.qtd, required this.cod});
}

class ListaCompras extends StatefulWidget {
  const ListaCompras({super.key});

  @override
  State<ListaCompras> createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  final List<Item> itens = [
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
    Item(nome: 'Arroz', qtd: 12, cod: 131254123123),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 400,
      color: Colors.white,
      child: ListView.separated(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          final item = itens[index];
          return ListTile(
            title: Text(
              "Item: ${item.nome} | Quantidade: ${item.qtd} | Codigo de barras: ${item.cod}",
            ),
            onTap: () {
              // Exemplo de interação
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Você selecionou ${item.nome}")),
              );
            },
          );
        },
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1, color: Colors.grey),
      ),
    );
  }
}
