import 'conector_db.dart';

class RepositorioProdutos {
  // Buscar todos os produtos
  static Future<List<Map<String, dynamic>>> buscarTodosProdutos() async {
    final conexao = await ConectorDb.obterConexao();

    final resultados = await conexao.execute('SELECT * FROM products');

    return resultados.rows.map((linha) {
      return {
        'id': linha.colAt(0),
        'name': linha.colAt(1),
        'price': linha.colAt(2),
        'stock': linha.colAt(3),
        'min_stock': linha.colAt(4),
        'category': linha.colAt(5),
        'created_at': linha.colAt(6),
        'updated_at': linha.colAt(7),
      };
    }).toList();
  }
}
