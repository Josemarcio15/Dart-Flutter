import 'package:flutter/material.dart';

class CampoEntrada extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final Icon iconeInicial;
  final Widget? iconeFinal;
  final bool obscureText;
  final String? Function(String?)? validador;

  const CampoEntrada({
    super.key,
    required this.controlador,
    required this.rotulo,
    required this.dica,
    required this.iconeInicial,
    this.iconeFinal,
    this.obscureText = false,
    this.validador,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: rotulo,
        hintText: dica,
        prefixIcon: iconeInicial,
        suffixIcon: iconeFinal,
        border: const OutlineInputBorder(),
      ),
      validator: validador,
    );
  }
}
