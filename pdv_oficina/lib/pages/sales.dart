import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      stock: int.parse(json['stock'].toString()),
    );
  }
}

class CartItem extends Product {
  int quantity;

  CartItem({
    required super.id,
    required super.name,
    required super.price,
    required super.stock,
    this.quantity = 1,
  });
}

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<Product> products = [];
  List<CartItem> cart = [];
  List<List<CartItem>> archivedCarts = [];
  bool loading = true;
  String searchTerm = '';
  bool finalizing = false;
  String paymentMethod = 'dinheiro';
  double? receivedAmount;
  String customerId = '';
  bool showSuccessDialog = false;
  String? archiveMessage;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() => loading = true);
    try {
      final res = await http.get(
        Uri.parse('http://localhost:3001/api/products'),
      );
      if (res.statusCode != 200) throw Exception('Erro ao carregar produtos');
      final data = jsonDecode(res.body) as List;
      products = data.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao carregar produtos: $e')));
    } finally {
      setState(() => loading = false);
    }
  }

  void addToCart(Product product) {
    final index = cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (cart[index].quantity < product.stock) {
        setState(() => cart[index].quantity++);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Quantidade máxima em estoque atingida'),
          ),
        );
      }
    } else {
      setState(
        () => cart.add(
          CartItem(
            id: product.id,
            name: product.name,
            price: product.price,
            stock: product.stock,
          ),
        ),
      );
    }
  }

  void removeFromCart(String productId) {
    setState(() => cart.removeWhere((item) => item.id == productId));
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = cart.indexWhere((item) => item.id == productId);
    if (index != -1 && newQuantity >= 1 && newQuantity <= cart[index].stock) {
      setState(() => cart[index].quantity = newQuantity);
    }
  }

  double get total =>
      cart.fold(0, (sum, item) => sum + item.price * item.quantity);

  double? get troco => paymentMethod == 'dinheiro' && receivedAmount != null
      ? receivedAmount! - total
      : null;

  void archiveCart() {
    if (cart.isNotEmpty) {
      setState(() {
        archivedCarts.add(List.from(cart));
        cart.clear();
        archiveMessage = 'Carrinho arquivado com sucesso!';
      });
      Future.delayed(
        const Duration(seconds: 3),
        () => setState(() => archiveMessage = null),
      );
    }
  }

  void restoreCart(int index) {
    setState(() {
      cart = List.from(archivedCarts[index]);
      archivedCarts.removeAt(index);
      archiveMessage = 'Carrinho restaurado com sucesso!';
    });
    Future.delayed(
      const Duration(seconds: 3),
      () => setState(() => archiveMessage = null),
    );
  }

  Future<void> finalizeSale() async {
    if (cart.isEmpty) return;
    setState(() => finalizing = true);
    try {
      final res = await http.post(
        Uri.parse('http://localhost:3001/api/sales'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'items': cart
              .map((e) => {'id': e.id, 'quantity': e.quantity})
              .toList(),
          'paymentMethod': paymentMethod,
          'customer_id': customerId.isEmpty ? null : customerId,
        }),
      );
      if (res.statusCode != 200) throw Exception('Erro ao finalizar venda');
      setState(() {
        cart.clear();
        paymentMethod = 'dinheiro';
        receivedAmount = null;
        customerId = '';
        showSuccessDialog = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro: $e')));
    } finally {
      setState(() => finalizing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((p) => p.name.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Vendas')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (archiveMessage != null)
              Container(
                color: Colors.green[100],
                padding: const EdgeInsets.all(8),
                child: Text(
                  archiveMessage!,
                  style: const TextStyle(color: Colors.green),
                ),
              ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar produtos...',
              ),
              onChanged: (v) => setState(() => searchTerm = v),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: loading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (_, index) {
                              final p = filteredProducts[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  title: Text(p.name),
                                  subtitle: Text(
                                    'Estoque: ${p.stock} - R\$ ${p.price.toStringAsFixed(2)}',
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed:
                                        cart.any(
                                          (c) =>
                                              c.id == p.id &&
                                              c.quantity >= p.stock,
                                        )
                                        ? null
                                        : () => addToCart(p),
                                    child: const Text('Adicionar'),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Carrinho (${cart.length} itens)'),
                            Expanded(
                              child: cart.isEmpty
                                  ? const Center(child: Text('Carrinho vazio'))
                                  : ListView.builder(
                                      itemCount: cart.length,
                                      itemBuilder: (_, index) {
                                        final item = cart[index];
                                        return ListTile(
                                          title: Text(item.name),
                                          subtitle: Text(
                                            'R\$ ${item.price.toStringAsFixed(2)}',
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: item.quantity > 1
                                                    ? () => updateQuantity(
                                                        item.id,
                                                        item.quantity - 1,
                                                      )
                                                    : null,
                                              ),
                                              Text('${item.quantity}'),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed:
                                                    item.quantity < item.stock
                                                    ? () => updateQuantity(
                                                        item.id,
                                                        item.quantity + 1,
                                                      )
                                                    : null,
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () =>
                                                    removeFromCart(item.id),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            ),
                            DropdownButton<String>(
                              value: paymentMethod,
                              items: const [
                                DropdownMenuItem(
                                  value: 'dinheiro',
                                  child: Text('Dinheiro'),
                                ),
                                DropdownMenuItem(
                                  value: 'pix',
                                  child: Text('PIX'),
                                ),
                                DropdownMenuItem(
                                  value: 'cartao',
                                  child: Text('Cartão'),
                                ),
                              ],
                              onChanged: (v) =>
                                  setState(() => paymentMethod = v!),
                            ),
                            if (paymentMethod == 'dinheiro')
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Valor Recebido',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (v) => setState(
                                  () => receivedAmount = double.tryParse(v),
                                ),
                              ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Cliente (opcional)',
                              ),
                              onChanged: (v) => setState(() => customerId = v),
                            ),
                            Text('Total: R\$ ${total.toStringAsFixed(2)}'),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: cart.isEmpty || finalizing
                                  ? null
                                  : finalizeSale,
                              child: finalizing
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text('Finalizar Venda'),
                            ),
                            ElevatedButton(
                              onPressed: cart.isEmpty ? null : archiveCart,
                              child: const Text('Arquivar Carrinho'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
