
import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/providers/product_list_provider.dart';
import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/services/wallet_services.dart';

import 'package:app_uteam/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/product_services.dart';


class PopularScreen extends StatefulWidget {
  PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
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
    final walletService = Provider.of<WalletService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct,walletService.selectedWallet),
      child: _PopularScreenBody(productsService: productsService),
    );
  }
}

class _PopularScreenBody extends StatefulWidget {
  _PopularScreenBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  ProductService productsService;
  @override
  State<_PopularScreenBody> createState() => _PopularScreenBodyState();
}

class _PopularScreenBodyState extends State<_PopularScreenBody> {
  @override
  Widget build(BuildContext context) {
    ProductService productService;
    final productListProvider = Provider.of<ProductListProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Productos'),
      // ),
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
                  'ProductPut',
                );
              },
              child: ProductCard(
                product: widget.productsService.products[index],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => Navigator.pushNamed(context, 'tasksPost'),
      // )
    );
  }
}
