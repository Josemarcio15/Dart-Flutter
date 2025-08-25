import 'package:flutter/material.dart';

class ValorProduto extends StatelessWidget {
  const ValorProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Text('R\$', style: TextStyle(fontSize: 20)),
    );
  }
}
