import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () => GoRouter.of(context).push('/cadastro'),
                  child: Text('Cadastrar Clientes'),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () => GoRouter.of(context).push('/cadastro'),
                  child: Text('Cadastrar Exercicios'),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () => GoRouter.of(context).push('/login'),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
