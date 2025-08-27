import 'package:flutter/material.dart';

class LabelTeclas extends StatelessWidget {
  const LabelTeclas({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "F5: Iniciar nova venda\nF6: Pesquisa de Produtos\nF7: Cancelar Item\nF8: Cancelar Venda\nF9: Finalizar Venda\nF10: Pesquisa de cliente",
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
