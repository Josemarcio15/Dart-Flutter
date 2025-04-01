import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), backgroundColor: Colors.amber),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(labelText: 'Login:'),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(labelText: 'Senha:'),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Login')),
                ElevatedButton(onPressed: () {}, child: Text('Voltar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
