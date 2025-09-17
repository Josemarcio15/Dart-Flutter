import 'package:exemplo_mariadb/db/filtro.dart';
import 'package:flutter/material.dart';
import 'package:exemplo_mariadb/db/query.dart'; // sua classe Filtro

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Filtro filtro = Filtro();
  late Future<List<Map<String, dynamic>>> futureProdutos;

  @override
  void initState() {
    super.initState();
    // inicializa o Future uma vez
    futureProdutos = filtro.resultado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Atualiza os dados quando o usuário tocar no botão
              setState(() {
                futureProdutos = filtro.resultado();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureProdutos, // usa o Future armazenado
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum produto encontrado.'));
          } else {
            var lista = snapshot.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                var item = lista[index];
                return ListTile(
                  title: Text(item["name"].toString()),
                  subtitle: Text(
                    "Preço: \$${item["price"]} - Estoque: ${item["stock"]}",
                  ),
                  leading: Text(item["id"].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
