import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String apiUrl =
      "COLE_AQUI_O_ENDPOINT_DA_SUA_API"; // ex: https://meusite.com/api/products
  final String token = "COLE_AQUI_O_TOKEN_JWT";

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar produtos');
    }
  }
}
