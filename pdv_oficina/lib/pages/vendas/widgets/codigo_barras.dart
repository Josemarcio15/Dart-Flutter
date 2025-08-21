import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodigoBarras extends StatefulWidget {
  const CodigoBarras({super.key});

  @override
  State<CodigoBarras> createState() => _CodigoBarrasState();
}

class _CodigoBarrasState extends State<CodigoBarras> {
  final codigoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(8.0), // dá um espaçamento
      child: Stack(
        children: [
          // fundo só atrás do texto
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              color: Colors.black, // cor do fundo do texto
            ),
          ),
          TextField(
            controller: codigoController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(color: Colors.white), // cor do texto
            decoration: InputDecoration(
              labelText: "Código de Barras",
              labelStyle: TextStyle(fontSize: 20, color: Colors.white70),
              border: OutlineInputBorder(),
              filled: false, // não preencher todo o campo
            ),
          ),
        ],
      ),
    );
  }
}
