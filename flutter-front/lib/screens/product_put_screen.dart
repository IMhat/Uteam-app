import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/wallet_services.dart';
//import 'package:app_uteam/providers/task_list_provider.dart';

class ProductPutScreen extends StatefulWidget {
  const ProductPutScreen({Key? key}) : super(key: key);

  @override
  State<ProductPutScreen> createState() => _ProductPutScreenState();
}

class _ProductPutScreenState extends State<ProductPutScreen> {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    final walletService = Provider.of<WalletService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct,walletService.selectedWallet),
      child: _ProductPutScreenBody(productsService: productsService),
    );
  }
}

class _ProductPutScreenBody extends StatefulWidget {
  _ProductPutScreenBody({Key? key, required this.productsService})
      : super(key: key);

  ProductService productsService;

  @override
  State<_ProductPutScreenBody> createState() => _ProductPutScreenBodyState();
}

class _ProductPutScreenBodyState extends State<_ProductPutScreenBody> {
  @override
  Widget build(BuildContext context) {
    final productServiceProvider = Provider.of<ProductService>(context);

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editar Producto '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: productForm.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: product.title,
                        onChanged: (value) => product.title = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Nombre del Producto'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El titulo es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: product.description,
                        onChanged: (value) => product.description = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Descripcion'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La descripcion es obligatoria';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: product.productImage,
                        onChanged: (value) => product.productImage = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Imagen'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'link a la imagen es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: product.points,
                        onChanged: (value) => product.points = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Puntos'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Los puntos son obligatorios';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.save_outlined),
                    onPressed: () async {
                      if (!productForm.isValidForm()) return;
                      await widget.productsService
                          .updateProduct(productForm.product);
                      productServiceProvider.products = [];
                      productServiceProvider.loadProducts();
                      Navigator.pushReplacementNamed(context, 'ManageProducts');
                    }),
                FloatingActionButton(
                    backgroundColor: Colors.white,
                    heroTag: null,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    onPressed: () async {
                      if (!productForm.isValidForm()) return;
                      await widget.productsService
                          .deleteProduct(productForm.product);
                      // taskServiceProvider.loadTasks();
                      productServiceProvider.products = [];
                      productServiceProvider.loadProducts();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
