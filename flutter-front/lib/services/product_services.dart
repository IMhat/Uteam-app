import 'dart:async';
import 'dart:convert';

import 'package:app_uteam/models/product_model.dart';

import 'package:app_uteam/models/product.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = '2qufsr9dx5.execute-api.us-east-1.amazonaws.com';
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
    final url = Uri.https(_baseUrl, 'products/${product.id}');
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
    final url = Uri.https(_baseUrl, 'products/${product.id}');
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
    final url = Uri.https(_baseUrl, 'products');
    final resp = await http.get(url);

    final Map<String, dynamic> usersMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData["products"]) {
      products.add(Product(
        item["id"],
        item["productName"],
        item["productImage"],
        item["description"],
        item["points"],
        // item["createdAt"],
      ));
    }

    isLoading = false;
    notifyListeners();
    return products;
  }

  Future<http.Response> saveProducts(
      String text, String text2, String text3, dynamic text4) {
    return http.post(
      Uri.parse(
          'https://2qufsr9dx5.execute-api.us-east-1.amazonaws.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'productName': text,
        'productImage': text2,
        'description': text3,
        'points': text4,
        // 'createAt': text5,
      }),
    );
  }
}
