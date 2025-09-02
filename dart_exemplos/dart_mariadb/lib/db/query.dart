import 'conector.dart';
import 'package:mysql1/mysql1.dart';

Future<Results> imprimir() async {
  MySqlConnection? conector;
  try {
    conector = await Conector();
    var itens = await conector.query('SELECT * FROM products');

    return itens;
  } catch (e) {
    print("erro na conexão");
    rethrow;
  } finally {
    if (conector != null) await conector.close();
  }
}
