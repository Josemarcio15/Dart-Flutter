import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> conectarBanco() async {
  var env = DotEnv()..load();

  final host = env['DB_HOST']!;
  final port = int.parse(env['DB_PORT']!);
  final user = env['DB_USER']!;
  final db = env['DB_NAME']!;
  final pass = env['DB_PASS'];

  final config = ConnectionSettings(
    host: host,
    port: port,
    user: user,
    db: db,
    password: pass,
  );
}
