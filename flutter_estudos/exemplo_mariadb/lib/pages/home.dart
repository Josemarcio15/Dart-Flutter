import 'package:flutter/material.dart';
//import '../db/query.dart'; // seu arquivo com a função busca()
import '../db/filtro.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Filtro filtro = Filtro();
  String textoBotao = "Iniciando";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: Column(
        children: [
          // ListView.separated(
          //   itemBuilder: filtro.resultado(),
          //   separatorBuilder: "|",
          //   itemCount: filtro.resultado().lenght,
          // ),
          ElevatedButton(
            onPressed: () async {
              List<Map<String, dynamic>> lista = await filtro.resultado();
              print(lista[0]);
              setState(() {
                textoBotao = lista[0]["name"];
              });
            },
            child: Text(textoBotao),
          ),
        ],
      ),
    );
  }
}
