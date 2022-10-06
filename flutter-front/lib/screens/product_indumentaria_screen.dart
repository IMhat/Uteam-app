import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/providers/wallet_form_provider.dart';
import 'package:app_uteam/services/wallet_services.dart';
import 'package:app_uteam/widgets/wallet_card.dart';
import 'package:flutter/material.dart';

import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/widgets/mi_user_card.dart';
import 'package:app_uteam/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductIndumenariaScreen extends StatefulWidget {
  ProductIndumenariaScreen({Key? key}) : super(key: key);

  @override
  State<ProductIndumenariaScreen> createState() =>
      _ProductIndumenariaScreenState();
}

class _ProductIndumenariaScreenState extends State<ProductIndumenariaScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final productIndumentariaService =
        Provider.of<ProductIndumentariaService>(context);

    return ChangeNotifierProvider(
      create: (_) =>
          ProductFormProvider(productIndumentariaService.selectedProduct),
      child: _ProductIndumenariaScreenBody(
          productIndumentariaService: productIndumentariaService),
    );
  }
}

class _ProductIndumenariaScreenBody extends StatefulWidget {
  _ProductIndumenariaScreenBody({
    Key? key,
    required this.productIndumentariaService,
  }) : super(key: key);

  ProductIndumentariaService productIndumentariaService;
  @override
  State<_ProductIndumenariaScreenBody> createState() =>
      _ProductIndumenariaScreenBodyState();
}

class _ProductIndumenariaScreenBodyState
    extends State<_ProductIndumenariaScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget.productIndumentariaService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              widget.productIndumentariaService.selectedProduct =
                  widget.productIndumentariaService.products[index].copy();
              Navigator.pushNamed(
                context,
                'AcercaDeIndumentaria',
              );
            },
            child: ProductCard(
              product: widget.productIndumentariaService.products[index],
            ),
          ),
        ),
      ),
    );
  }
}
