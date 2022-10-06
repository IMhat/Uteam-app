import 'package:app_uteam/services/wallet_services.dart';
import 'package:flutter/material.dart';
import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/services/product_services.dart';
import 'package:provider/provider.dart';
import '../services/product_services.dart';
import '../widgets/product_detail_card.dart';

class AcercaDeCursos extends StatefulWidget {
  AcercaDeCursos({Key? key}) : super(key: key);

  @override
  State<AcercaDeCursos> createState() => _AcercaDeCursosState();
}

class _AcercaDeCursosState extends State<AcercaDeCursos> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final productsService = Provider.of<ProductCursosService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct),
      child: _AcercaDeCursosBody(productsService: productsService),
    );
  }
}

class _AcercaDeCursosBody extends StatefulWidget {
  _AcercaDeCursosBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  ProductCursosService productsService;

  @override
  State<_AcercaDeCursosBody> createState() => _AcercaDeCursosBodyState();
}

class _AcercaDeCursosBodyState extends State<_AcercaDeCursosBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Productos'),
      // ),
      body: Material(
        child: Center(
          child: ProductDetailCard(
            product: widget.productsService.selectedProduct,
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
