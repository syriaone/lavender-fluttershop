import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocalRepository {
  static Future<List<dynamic>> categories() async {
    final s = await rootBundle.loadString('assets/data/categories.json');
    return jsonDecode(s) as List<dynamic>;
    
  }

  static Future<List<dynamic>> products() async {
    final s = await rootBundle.loadString('assets/data/products.json');
    return jsonDecode(s) as List<dynamic>;
  }
}


