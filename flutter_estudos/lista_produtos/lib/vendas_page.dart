import 'package:flutter/material.dart';
import 'package:lista_produtos/lista_compras.dart';

class VendasPage extends StatefulWidget {
  const VendasPage({super.key});

  @override
  State<VendasPage> createState() => _VendasPageState();
}

class _VendasPageState extends State<VendasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Item"),
          Expanded(child: ListaCompras()),
        ],
      ),
    );
  }
}
