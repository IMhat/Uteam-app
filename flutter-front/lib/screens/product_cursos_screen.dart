import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/providers/wallet_form_provider.dart';
import 'package:app_uteam/services/wallet_services.dart';
import 'package:app_uteam/widgets/wallet_card.dart';
import 'package:flutter/material.dart';

import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/widgets/mi_user_card.dart';
import 'package:app_uteam/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductCursosScreen extends StatefulWidget {
  ProductCursosScreen({Key? key}) : super(key: key);

  @override
  State<ProductCursosScreen> createState() => _ProductCursosScreenState();
}

class _ProductCursosScreenState extends State<ProductCursosScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final productCursosService = Provider.of<ProductCursosService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productCursosService.selectedProduct),
      child:
          _ProductCursosScreenBody(productCursosService: productCursosService),
    );
  }
}

class _ProductCursosScreenBody extends StatefulWidget {
  _ProductCursosScreenBody({
    Key? key,
    required this.productCursosService,
  }) : super(key: key);

  ProductCursosService productCursosService;
  @override
  State<_ProductCursosScreenBody> createState() =>
      _ProductCursosScreenBodyState();
}

class _ProductCursosScreenBodyState extends State<_ProductCursosScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget.productCursosService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              widget.productCursosService.selectedProduct =
                  widget.productCursosService.products[index].copy();
              Navigator.pushNamed(
                context,
                'AcercaDeCursos',
              );
            },
            child: ProductCard(
              product: widget.productCursosService.products[index],
            ),
          ),
        ),
      ),
    );
  }
}
