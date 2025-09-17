import 'package:exemplo_mariadb/db/query.dart';
// import 'package:flutter/material.dart';
// import 'package:mysql1/mysql1.dart';

class Filtro {
  Future<List<Map<String, dynamic>>> resultado() async {
    var resposta = await busca();

    List<Map<String, dynamic>> lista = [];
    for (var row in resposta) {
      lista.add({
        "id": row["id"],
        "name": row["name"],
        "price": row["price"],
        "stock": row["stock"],
      });
    }
    return lista;
  }
}
