class Produto {
  final int id;
  final String name;
  final int stock;
  final double price;
  final int minStock;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;

  Produto({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.minStock,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      name: map['name'],
      stock: map['stock'],
      price: map['price'].toDouble(),
      minStock: map['min_stock'],
      category: map['category'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }
}
