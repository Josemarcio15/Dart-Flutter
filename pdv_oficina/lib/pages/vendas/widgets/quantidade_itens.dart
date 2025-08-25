import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantidadeItens extends StatefulWidget {
  const QuantidadeItens({super.key});

  @override
  State<QuantidadeItens> createState() => _QuantidadeItensState();
}

class _QuantidadeItensState extends State<QuantidadeItens> {
  final codigoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      //padding: EdgeInsets.all(8.0), // dá um espaçamento
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              color: Colors.blue, // cor do fundo do texto
            ),
          ),
          TextField(
            controller: codigoController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
              labelText: "QTD:",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              filled: true,
              fillColor: Colors.white, // fundo do texto
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // cantos arredondados
              ),
            ),
          ),
        ],
      ),
    );
  }
}
