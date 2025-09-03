import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'conector.dart';

Future<Results> busca() async {
  MySqlConnection? conector;

  try {
    conector = await conectorBanco();
    var itens = await conector.query('SELECT * FROM products');
    return itens;
  } catch (e) {
    debugPrint("Erro ao buscar dados!");
    rethrow;
  } finally {
    if (conector != null) {
      await conector.close();
    }
  }
}
