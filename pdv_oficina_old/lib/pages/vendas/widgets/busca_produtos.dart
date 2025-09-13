import 'package:flutter/material.dart';

class BuscaProdutos extends StatefulWidget {
  const BuscaProdutos({super.key});

  @override
  State<BuscaProdutos> createState() => _BuscaProdutosState();
}

class _BuscaProdutosState extends State<BuscaProdutos> {
  final TextEditingController controller = TextEditingController();
  final List<String> nomes = [
    'Paulo',
    'Patrícia',
    'Lucas',
    'Pacífico',
    'Marcelo',
  ];
  List<String> resultados = [];

  @override
  void initState() {
    super.initState();
    resultados = nomes;
    controller.addListener(() {
      final texto = controller.text.toLowerCase();
      setState(() {
        resultados = nomes
            .where((nome) => nome.toLowerCase().contains(texto))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Buscar Produto',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: resultados.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(resultados[index]),
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pop(resultados[index]); // retorna o valor selecionado
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
