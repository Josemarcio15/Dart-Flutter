import 'package:flutter/material.dart';
import 'package:lista_produtos/db/query.dart';
import 'package:lista_produtos/pages/widget/lista_compras.dart';

class VendasPage extends StatefulWidget {
  const VendasPage({super.key});
  @override
  State<VendasPage> createState() => _VendasPageState();
}

class _VendasPageState extends State<VendasPage> {
  Future<List<Map<String, dynamic>>> produtos() async {
    var resultado = await buscar();
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: produtos(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text('Erro: ${asyncSnapshot.error}'));
          } else {
            var dados = asyncSnapshot.data!;
            return Column(
              children: dados.map((item) => Text(item['nome'])).toList(),
            );
          }
        },
      ),
    );
  }
}
