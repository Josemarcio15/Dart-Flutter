import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'conector.dart';

Future<Results> buscar() async {
  MySqlConnection? conn;

  try {
    conn = await conectarBanco();
    var itens = await conn.query('SELECT * FROM products');
    return itens;
  } catch (e) {
    debugPrint("Falha ao buscar");
    rethrow;
  } finally {
    if (conn != null) {
      await conn.close();
    }
  }
}
