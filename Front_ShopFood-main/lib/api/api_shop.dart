import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCustomer {
  static Future<bool> veifyCustomer(String id, String password) async {
    try {
      final url = Uri.parse('http://192.168.56.1:8083/api/customers/verify');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type':
              'application/json', // Adjust the content type as needed.
        },
        body: jsonEncode({
          'id': id,
          'password': password,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('POST request successful');
        print('Response data: ${response.body}');
        return true;
      } else {
        print('Failed to make the POST request');
        print('Status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
