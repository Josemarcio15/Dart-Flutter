import 'package:dotenv/dotenv.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> Conector() async {
  var env = DotEnv()..load();

  final host = env['DB_HOST']!;
  final port = int.parse(env['DB_PORT']!);
  final banco = env['DB_NAME']!;
  final usuario = env['DB_USER']!;
  final senha = env['DB_PASS']!;

  final configuracao = ConnectionSettings(
    host: host,
    port: port,
    user: usuario,
    password: senha,
    db: banco,
  );
  MySqlConnection? conn;
  try {
    conn = await MySqlConnection.connect(configuracao);
    print('Conexão estabelecida com sucesso!');
    return conn;
  } catch (e) {
    print("ocorreu um erro");
    rethrow;
  }
}
