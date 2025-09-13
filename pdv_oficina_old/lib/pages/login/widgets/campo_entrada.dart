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

  /// Construtor para campo de e-mail
  CampoEntrada.email({Key? key, required TextEditingController controlador})
    : this(
        key: key,
        controlador: controlador,
        rotulo: 'E-mail',
        dica: 'Digite seu e-mail',
        iconeInicial: const Icon(Icons.email),
        validador: (valor) {
          if (valor == null || valor.isEmpty) return 'E-mail obrigatório';
          if (!valor.contains('@')) return 'E-mail inválido';
          return null;
        },
      );

  /// Construtor para campo de senha
  CampoEntrada.senha({
    Key? key,
    required TextEditingController controlador,
    bool senhaVisivel = false,
    required VoidCallback alternarVisibilidade,
  }) : this(
         key: key,
         controlador: controlador,
         rotulo: 'Senha',
         dica: 'Digite sua senha',
         iconeInicial: const Icon(Icons.password),
         obscureText: !senhaVisivel,
         iconeFinal: IconButton(
           icon: Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off),
           onPressed: alternarVisibilidade,
         ),
         validador: (valor) {
           if (valor == null || valor.isEmpty) return 'Senha obrigatória';
           if (valor.length < 6) return 'Senha muito curta';
           return null;
         },
       );

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
