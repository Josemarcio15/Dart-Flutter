import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> conectorBanco() async {
  var env = DotEnv()..load();

  final host = env['DB_HOST']!;
  final port = int.parse(env['DB_PORT']!);
  final database = env['DB_NAME']!;
  final user = env['DB_USER']!;
  final password = env['DB_PASS']!;

  final config = ConnectionSettings(
    host: host,
    port: port,
    db: database,
    user: user,
    password: password,
  );
  MySqlConnection? conn;
  try {
    conn = await MySqlConnection.connect(config);
    debugPrint("Conexão bem sucedida!");
    return conn;
  } catch (e) {
    debugPrint("Erro ao conectar");
    rethrow;
  }
}
