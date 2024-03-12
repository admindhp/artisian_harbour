import 'dart:convert';
import 'package:artisian_harbour/Models/Product.dart';
import 'package:flutter/services.dart';

class DataProvider {
  static Future<List<Product>> getProducts() async {
    String data = await rootBundle.loadString('assets/products.json');
    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((json) => Product.fromJson(json)).toList();
  }
}
