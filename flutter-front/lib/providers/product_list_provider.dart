import 'package:app_uteam/models/product_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ProductListProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  //set tasks(List<TaskModel> tasks) {}

  Future<ProductModel> nuevaProduct(String productName, String productImage,
      String description, dynamic points) async {
    final nuevaProduct = ProductModel(
        productName: productName,
        productImage: productImage,
        description: description,
        points: points);
    // final id = (await DBProvider.db.nuevaTask(nuevaTask));
    // Asignar el ID de la base de datos al modelo
    // nuevaTask.id = id.toString();

    this.products.add(nuevaProduct);
    notifyListeners();

    return nuevaProduct;
  }

  cargarProducts() async {
    // final tasks = await DBProvider.db.getTodasLasTasks();
    this.products = [...products];
    print(products);
    notifyListeners();
  }

  borrarTodos() async {
    // await DBProvider.db.deleteAllTasks();
    this.products = [];
    notifyListeners();
  }

  borrarProductPorId(
    String id,
  ) async {
    // await DBProvider.db.deleteTask(id);
    this.cargarProducts();
  }
}
