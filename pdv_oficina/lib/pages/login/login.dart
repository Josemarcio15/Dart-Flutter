import 'package:flutter/material.dart';
import 'widgets/campo_entrada.dart'; // Importe seu widget customizado aqui

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Aqui você chamaria sua API
      print('Email: ${emailController.text}');
      print('Senha: ${senhaController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                child: CampoEntrada(
                  controlador: emailController,
                  rotulo: 'E-mail',
                  dica: 'Digite seu e-mail',
                  iconeInicial: const Icon(Icons.email),
                  validador: (valor) {
                    if (valor == null || valor.isEmpty)
                      return 'E-mail obrigatório';
                    if (!valor.contains('@')) return 'E-mail inválido';
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 350,
                child: CampoEntrada(
                  controlador: senhaController,
                  rotulo: 'Senha',
                  dica: 'Digite sua senha',
                  iconeInicial: const Icon(Icons.password),
                  validador: (valor) {
                    if (valor == null || valor.isEmpty)
                      return 'Senha obrigatória';
                    if (valor.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  obscureText: !_senhaVisivel,
                  iconeFinal: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _senhaVisivel = !_senhaVisivel;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
