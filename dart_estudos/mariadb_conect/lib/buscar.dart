import "./db/query.dart";

void main() async {
  var resultados = await imprimir();
  var lista = resultados.toList();

  for (var i = 0; i < lista.length; i++) {
    print(lista[i]['name']);
  }
}
