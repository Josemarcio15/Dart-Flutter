import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  PerguntaApp({super.key});

  var perguntaSelecionada = 0;
  void responder() {
    perguntaSelecionada++;
    print('pergunta respondida $perguntaSelecionada');
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'qual é a sua cor favorita?',
      'qual é a sua aniaml favorito?',
    ];

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas app"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            ElevatedButton(
              onPressed: responder,
              child: Text(perguntas[perguntaSelecionada]),
            ),
            ElevatedButton(onPressed: responder, child: Text("Respota 2")),
            ElevatedButton(onPressed: responder, child: Text("Respota 3")),
          ],
        ),
      ),
    );
  }
}
