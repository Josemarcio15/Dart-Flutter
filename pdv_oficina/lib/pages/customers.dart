import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// MODELS
class RepairItem {
  String id;
  String description;
  double cost;
  bool paid;
  String? paymentMethod;
  double? paidValue;

  RepairItem({
    required this.id,
    required this.description,
    required this.cost,
    this.paid = false,
    this.paymentMethod,
    this.paidValue,
  });
}

class Vehicle {
  String id;
  String model;
  String plate;
  List<RepairItem> items;

  Vehicle({
    required this.id,
    required this.model,
    required this.plate,
    required this.items,
  });
}

class Customer {
  String id;
  String name;
  String email;
  String phone;
  String cpfCnpj;
  String address;
  String city;
  String state;
  String postalCode;
  List<Vehicle> vehicles;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cpfCnpj,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.vehicles,
  });
}

// PAGE
class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  List<Customer> customers = [];
  List<Customer> filteredCustomers = [];
  bool loading = true;
  String? error;
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      final res = await http.get(
        Uri.parse("http://localhost:3001/api/customers"),
      );
      if (res.statusCode != 200) throw Exception('Erro ${res.statusCode}');
      final data = jsonDecode(res.body) as List;
      customers = data.map((c) {
        final vehicles = (c['vehicles'] as List<dynamic>? ?? []).map((v) {
          final items = (v['items'] as List<dynamic>? ?? []).map((i) {
            return RepairItem(
              id: i['id'],
              description: i['description'],
              cost: double.parse(i['cost'].toString()),
              paid: i['paid'] ?? false,
              paymentMethod: i['payment_method'],
              paidValue: i['paid_value'] != null
                  ? double.parse(i['paid_value'].toString())
                  : null,
            );
          }).toList();
          return Vehicle(
            id: v['id'],
            model: v['model'],
            plate: v['plate'],
            items: items,
          );
        }).toList();

        return Customer(
          id: c['id'],
          name: c['name'],
          email: c['email'],
          phone: c['phone'],
          cpfCnpj: c['cpf_cnpj'],
          address: c['address'],
          city: c['city'],
          state: c['state'],
          postalCode: c['postal_code'],
          vehicles: vehicles,
        );
      }).toList();

      applyFilter();
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void applyFilter() {
    setState(() {
      filteredCustomers = customers.where((c) {
        return c.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
            c.email.toLowerCase().contains(searchTerm.toLowerCase()) ||
            c.cpfCnpj.contains(searchTerm);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());
    if (error != null) return Center(child: Text(error!));

    final totalCustomers = customers.length;
    int totalItemsPaid = 0;
    int totalItemsPending = 0;
    double totalRevenue = 0;

    for (var c in customers) {
      for (var v in c.vehicles) {
        for (var i in v.items) {
          if (i.paid) {
            totalItemsPaid++;
            totalRevenue += i.cost;
          } else {
            totalItemsPending++;
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Clientes da Oficina")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search
            TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por nome, email ou CPF/CNPJ',
              ),
              onChanged: (v) {
                searchTerm = v;
                applyFilter();
              },
            ),
            const SizedBox(height: 8),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _statCard("Total de Clientes", totalCustomers.toString()),
                _statCard("Itens Pagos", totalItemsPaid.toString()),
                _statCard("Itens Pendentes", totalItemsPending.toString()),
                _statCard(
                  "Receita Total",
                  "R\$ ${totalRevenue.toStringAsFixed(2)}",
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Customer List
            Expanded(
              child: ListView.builder(
                itemCount: filteredCustomers.length,
                itemBuilder: (_, index) {
                  final c = filteredCustomers[index];
                  return Card(
                    child: ListTile(
                      title: Text(c.name),
                      subtitle: Text("${c.email}\n${c.phone}\n${c.cpfCnpj}"),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Widget _statCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
