class Produto {
  String nome;
  int codigo;
  int qtd;
  double valor;
  double total;

  Produto(this.nome, this.codigo, this.qtd, this.valor) : total = valor * qtd;
}

// Lista simulando produtos vindos do banco
List<Produto> produtosMock = [
  Produto("Arroz", 1234, 1, 20.99),
  Produto("Feijão", 5678, 2, 15.50),
  Produto("Macarrão", 9012, 3, 7.30),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
  Produto("Açúcar", 3456, 5, 4.20),
];
