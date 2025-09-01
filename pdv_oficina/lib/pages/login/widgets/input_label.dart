import 'package:flutter/material.dart';

class CampoEntrada extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final Icon iconeInicial;
  final String? Function(String?)? validador;
  final bool ocultarTexto;

  const CampoEntrada({
    super.key,
    required this.controlador,
    required this.rotulo,
    required this.dica,
    required this.iconeInicial,
    this.validador,
    this.ocultarTexto = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      obscureText: ocultarTexto,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        hintText: dica,
        prefixIcon: iconeInicial,
        border: const OutlineInputBorder(),
      ),
      validator: validador,
    );
  }
}
