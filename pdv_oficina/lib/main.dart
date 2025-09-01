import 'package:flutter/material.dart';
import 'package:pdv_oficina/pages/login/login.dart';
//import 'package:pdv_oficina/pages/vendas/vendas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
