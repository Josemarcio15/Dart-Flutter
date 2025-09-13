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
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: Colors.blue)),
          TextField(
            controller: codigoController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
              labelText: "Qtd:",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
