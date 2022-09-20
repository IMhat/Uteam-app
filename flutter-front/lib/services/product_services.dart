import 'dart:async';
import 'dart:convert';
import 'package:app_uteam/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';
  List<Product> products = [];
  late Product selectedProduct;
  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  ProductService() {
    // _dbProvider = DBProvider();
    loadProducts();
  }

  Future<String> updateProduct(Product product) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/products/${product.id}');
    final resp = await http.put(url, body: product.toJson());
    final decodeData = resp.body;
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    // _dbProvider.updateTask(TaskModel(
    //     id: task.id, title: task.title, description: task.description));
    notifyListeners();
    return product.id;
  }

  Future<String> deleteProduct(Product product) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/products/${product.id}');
    final resp = await http.delete(url, body: product.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    // _dbProvider.deleteTask(task.id);
    notifyListeners();
    return product.id;
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, '/api/products');
    final resp = await http.get(url);

    final List<dynamic> usersMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      products.add(Product(
        item["id"],
        item["title"],
        item["type"],
        item["productImage"],
        item["description"],
        item["points"],
        item["due"],
      ));
    }

    isLoading = false;
    notifyListeners();
    return products;
  }

  Future<http.Response> saveProducts(String text, String text2, String text3,
      String text4, dynamic text5, dynamic text6) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': text,
        'type': text2,
        'productImage': text3,
        'description': text4,
        'points': text5,
        'due': text6
      }),
    );
  }
}
