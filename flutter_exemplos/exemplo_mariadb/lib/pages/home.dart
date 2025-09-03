import 'package:flutter/material.dart';
import '../db/query.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final cnt = busca();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView());
  }
}
