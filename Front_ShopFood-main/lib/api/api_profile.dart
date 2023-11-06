import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:store_app/models/user.dart';

import '../models/product.dart';

class ApiProfile {
  // static Future<List<User>> getProfile(String id) async {
  //   try {
  //     final url = Uri.parse('http://192.168.56.1:8083/api/customers/getcus/1');
  //     final response = await http.get(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type':
  //             'application/json', // Adjust the content type as needed.
  //       },
  //     );

  //     if (response.statusCode == 202) {
  //       final List<dynamic> jsonData = json.decode(response.body);
  //       final List<User> user = jsonData.map((json) {
  //         return User(
  //           id: json['id'],
  //           firstName: json['firstName'],
  //           lastName: json['lastName'],
  //           password: json['password'],
  //           createAt: json['createAt'],
  //           cuser: json['cuser'],
  //         );
  //       }).toList();

  //       return user;
  //     } else {
  //       // Handle the case where the request was not successful
  //       throw Exception(
  //           'Failed to fetch products. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
  static const String url = "http://192.168.56.1:8083/api/customers/getcus/2";
  static Future<User> getProfile() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseProfile(response.body);
      } else {
        return User();
      }
    } catch (e) {
      return User();
    }
  }

  static User parseProfile(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);
    return User.fromJson(parsed);
  }
}
