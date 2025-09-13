import 'package:dotenv/dotenv.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> conectar() async {
  var env = DotEnv()..load();

  final host = env['DB_HOST']!;
  final port = int.parse(env['DB_PORT']!);
  final db = env['DB_NAME']!;
  final user = env['DB_USER']!;
  final pass = env['DB_PASS']!;

  final configuracao = ConnectionSettings(
    host: host,
    port: port,
    user: user,
    db: db,
    password: pass,
  );
  MySqlConnection? conn;
  try {
    conn = await MySqlConnection.connect(configuracao);
    print("conected");
    return conn;
  } catch (e) {
    print("Erro na conexão");
    rethrow;
  }
}
