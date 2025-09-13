import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mysql_client/mysql_client.dart';

class ConectorDb {
  static MySQLConnection? _conexao;

  static Future<MySQLConnection> obterConexao() async {
    if (_conexao != null && _conexao!.connected) {
      return _conexao!;
    }

    // Pega os dados do .env
    final servidor = dotenv.env['DB_HOST']!;
    final porta = int.parse(dotenv.env['DB_PORT']!);
    final nomeBanco = dotenv.env['DB_NAME']!;
    final usuario = dotenv.env['DB_USER']!;
    final senha = dotenv.env['DB_PASS']!;

    // Cria uma nova conexão
    _conexao = await MySQLConnection.createConnection(
      host: servidor,
      port: porta,
      userName: usuario,
      password: senha,
      databaseName: nomeBanco,
    );

    await _conexao!.connect();
    return _conexao!;
  }
}
