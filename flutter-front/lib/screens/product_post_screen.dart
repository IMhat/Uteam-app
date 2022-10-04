// import 'package:app_uteam/models/product_model.dart';
// import 'package:app_uteam/providers/db_provider.dart';
// import 'package:app_uteam/providers/product_form_provider.dart';
// import 'package:app_uteam/providers/product_list_provider.dart';
// import 'package:app_uteam/services/product_services.dart';
// import 'package:app_uteam/ui/input_decorations.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductPostScreen extends StatefulWidget {
//   const ProductPostScreen({Key? key}) : super(key: key);

//   @override
//   State<ProductPostScreen> createState() => _ProductPostScreenState();
// }

// class _ProductPostScreenState extends State<ProductPostScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _productImageController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _pointsController = TextEditingController();

//   late ProductModel productModel;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final productServiceProvider =
//         Provider.of<ProductService>(context, listen: false);
//     final scanListProvider =
//         Provider.of<ProductListProvider>(context, listen: false);
//     // final taskForm = Provider.of<TaskFormProvider>(context);
//     //final task = taskForm.task;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Nuevo Producto'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               width: double.infinity,
//               height: 600,
//               decoration: _buildBoxDecoration(),
//               child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: _titleController,
//                         decoration: InputDecorations.authInputDecoration(
//                             hintText: 'Nombre del Producto',
//                             labelText: 'Producto'),
//                         validator: (String? dato) {
//                           if (dato!.isEmpty) {
//                             return 'Este campo es requerido';
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                           controller: _productImageController,
//                           decoration: InputDecorations.authInputDecoration(
//                               hintText: 'Imagen del Producto',
//                               labelText: 'Imagen'),
//                           validator: (String? dato) {
//                             if (dato!.isEmpty) {
//                               return 'Este campo es requerido';
//                             }
//                           }),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                           controller: _descriptionController,
//                           decoration: InputDecorations.authInputDecoration(
//                               hintText: 'Descripcion del Producto',
//                               labelText: 'Descripcion'),
//                           validator: (String? dato) {
//                             if (dato!.isEmpty) {
//                               return 'Este campo es requerido';
//                             }
//                           }),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                           controller: _pointsController,
//                           decoration: InputDecorations.authInputDecoration(
//                               hintText: 'Puntos del Producto',
//                               labelText: 'Puntos'),
//                           validator: (String? dato) {
//                             if (dato!.isEmpty) {
//                               return 'Este campo es requerido';
//                             }
//                           }),
//                       const SizedBox(height: 30),
//                     ],
//                   )),
//             ),
//             const SizedBox(
//               height: 100,
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.save_outlined),
//           onPressed: () async {
//             if (_formKey.currentState!.validate()) {
//               await ProductService().saveProducts(
//                   _titleController.text,
//                   _productImageController.text,
//                   _descriptionController.text,
//                   _pointsController.text);

//               final productListProvider =
//                   Provider.of<ProductListProvider>(context, listen: false);
//               productListProvider.nuevaProduct(
//                   _titleController.text,
//                   _productImageController.text,
//                   _descriptionController.text,
//                   _pointsController.text);
//             }
//             productServiceProvider.products = [];
//             productServiceProvider.loadProducts();
//             Navigator.of(context).pop();
//           }),
//     );
//   }
// }

// BoxDecoration _buildBoxDecoration() => const BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.only(
//         bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
