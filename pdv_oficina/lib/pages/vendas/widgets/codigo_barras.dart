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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: codigoController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(color: Colors.red),
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          labelText: "Código de Barras",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 25, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
