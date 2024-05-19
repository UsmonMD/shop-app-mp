import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/logic/models/products.dart';

class Api {
  static Future<List<Products>> getProducts() async {
 
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => Products.fromJson(json)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
