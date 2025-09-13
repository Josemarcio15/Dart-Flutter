import 'package:flutter/material.dart';
import '../db/query.dart'; // seu arquivo com a função busca()

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: FutureBuilder(
        future: busca(), // chama a função do banco
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final resultados = snapshot.data!;
          return ListView.builder(
            itemCount: resultados.length,
            itemBuilder: (context, index) {
              final row = resultados.elementAt(index);
              return ListTile(
                title: Text(row['name'].toString()),
                subtitle: Text('Preço: R\$ ${row['price']}'),
              );
            },
          );
        },
      ),
    );
  }
}
