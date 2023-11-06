import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiProduct {
  static Future<List<Product>> getProducts() async {
    try {
      final url = Uri.parse('http://192.168.56.1:8083/api/products/');
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type':
              'application/json', // Adjust the content type as needed.
        },
      );

      if (response.statusCode == 202) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Product> products = jsonData.map((json) {
          return Product(
            id: json['id'],
            name: json['productName'],
            price: json['price'],
            image: json['image'],
          );
        }).toList();

        return products;
      } else {
        // Handle the case where the request was not successful
        throw Exception(
            'Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
