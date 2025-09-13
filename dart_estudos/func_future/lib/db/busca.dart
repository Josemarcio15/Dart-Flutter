import 'package:func_future/db/conectar.dart';
import 'package:mysql1/mysql1.dart';

class Busca {
  Future<Results?> busca() async {
    MySqlConnection? conexao;
    try {
      conexao = await conectar();
      var resultados = await conexao.query('SELECT * FROM products');
      var lista = [];
      for (var item in resultados) {
        print(item);
      }
      return resultados;
    } catch (e) {
      rethrow;
    } finally {
      if (conexao != null) await conexao.close();
    }
  }
}
