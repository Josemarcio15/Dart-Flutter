//import 'package:estudos_widgets/home.dart';
//import 'package:estudos_widgets/sidebar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.grey[800], body: Text("ola")),
    );
  }
}
