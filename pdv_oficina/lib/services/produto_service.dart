import 'package:pdv_oficina/models/produto.dart';
import 'package:pdv_oficina/services/conector_db.dart';

class ServicoProduto {
  static Future<List<Produto>> listarProdutos() async {
    final conexao = await ConectorDb.obterConexao();

    final resultados = await conexao.execute('SELECT * FROM products');

    final List<Produto> produtos = [];

    for (final linha in resultados.rows) {
      produtos.add(Produto.fromMap(linha.assoc()));
    }

    return produtos;
  }

  static Future obterProdutos() async {}
}
