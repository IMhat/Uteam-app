import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/product_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/providers/product_list_provider.dart';
import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../services/product_services.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen({Key? key}) : super(key: key);

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final productsService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct),
      child: _ManageProductScreenBody(productsService: productsService),
    );
  }
}

class _ManageProductScreenBody extends StatefulWidget {
  _ManageProductScreenBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  ProductService productsService;
  @override
  State<_ManageProductScreenBody> createState() =>
      _ManageProductScreenBodyState();
}

class _ManageProductScreenBodyState extends State<_ManageProductScreenBody> {
  @override
  Widget build(BuildContext context) {
    ProductService productService;
    final productListProvider = Provider.of<ProductListProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Gestor de Productos'),
        ),
        body: Material(
          child: Center(
            child: ListView.builder(
              //itemCount: taskListProvider.tasks.length,
              itemCount: widget.productsService.products.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  widget.productsService.selectedProduct =
                      widget.productsService.products[index].copy();
                  Navigator.pushNamed(
                    context,
                    'productsPut',
                  );
                },
                child: ProductCard(
                  product: widget.productsService.products[index],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, 'productsPost'),
        ));
  }
}
