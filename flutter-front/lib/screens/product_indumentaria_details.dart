// import 'package:app_uteam/services/wallet_services.dart';
// import 'package:flutter/material.dart';
// import 'package:app_uteam/providers/product_form_provider.dart';
// import 'package:app_uteam/services/product_services.dart';
// import 'package:provider/provider.dart';
// import '../services/product_services.dart';
// import '../widgets/product_detail_card.dart';

// class AcercaDeIndumentaria extends StatefulWidget {
//   AcercaDeIndumentaria({Key? key}) : super(key: key);

//   @override
//   State<AcercaDeIndumentaria> createState() => _AcercaDeIndumentariaState();
// }

// class _AcercaDeIndumentariaState extends State<AcercaDeIndumentaria> {
//   @override
//   Widget build(BuildContext context) {
//     // DBProvider.db.database;
//     // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
//     // DBProvider.db.nuevaTask(tempTask);
//     // print(tempTask);
//     // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

//     //DBProvider.db.getTodasLasTasks().then((print));
//     //DBProvider.db.deleteAllTasks();
//     final productsService = Provider.of<ProductIndumentariaService>(context);

//     return ChangeNotifierProvider(
//       create: (_) => ProductFormProvider(productsService.selectedProduct),
//       child: _AcercaDeIndumentariaBody(productsService: productsService),
//     );
//   }
// }

// class _AcercaDeIndumentariaBody extends StatefulWidget {
//   _AcercaDeIndumentariaBody({
//     Key? key,
//     required this.productsService,
//   }) : super(key: key);

//   ProductIndumentariaService productsService;

//   @override
//   State<_AcercaDeIndumentariaBody> createState() =>
//       _AcercaDeIndumentariaBodyState();
// }

// class _AcercaDeIndumentariaBodyState extends State<_AcercaDeIndumentariaBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Productos'),
//       // ),
//       body: Material(
//         child: Center(
//           child: ProductDetailCard(
//             product: widget.productsService.selectedProduct,
//             wallet: widget.,
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   child: Icon(Icons.add),
//       //   onPressed: () => Navigator.pushNamed(context, 'tasksPost'),
//       // )
//     );
//   }
// }











// // class AcercaDe extends StatelessWidget {
// //   const AcercaDe({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           //backgroundimage
// //           Positioned(
// //               left: 0,
// //               right: 0,
// //               child: Container(
// //                 width: double.maxFinite,
// //                 height: 350,
// //                 decoration: BoxDecoration(
// //                     image: DecorationImage(
// //                         fit: BoxFit.cover,
// //                         image: AssetImage("assets/remera.jpg"))),
// //               )),
// //           //icon widget
// //           Positioned(
// //               top: 45,
// //               left: 20,
// //               right: 20,
// //               child: Row(
// //                 children: [
// //                   AppIcon(icon: Icons.arrow_back_ios),
// //                   Text("atras"),
// //                 ],
// //               )),
// //           //introduction of product
// //           Positioned(
// //               left: 0,
// //               right: 0,
// //               bottom: 0,
// //               top: 320,
// //               child: Container(
// //                 padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
// //                 decoration: const BoxDecoration(
// //                     borderRadius: BorderRadius.only(
// //                         topRight: Radius.circular(25),
// //                         topLeft: Radius.circular(25)),
// //                     boxShadow: [
// //                       BoxShadow(color: Colors.grey),
// //                     ],
// //                     color: Colors.white),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const AppColumn(text: "Remera de Uteam"),
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     BigText(text: "Descripcion"),
// //                     SmallText(text: "Descripcion")
// //                   ],
// //                 ),
// //               )),
// //           //expandable text widget
// //         ],
// //       ),
// //       bottomNavigationBar: Container(
// //         height: 120,
// //         padding:const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
// //         decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius:const BorderRadius.only(
// //               topLeft: Radius.circular(20 * 2),
// //               topRight: Radius.circular(20 * 2),
// //             ),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.grey[850]!.withOpacity(0.80),
// //                 blurRadius: 10,
// //               )
// //             ]),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Container(
// //               padding:const EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
// //               decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(20), color: Colors.white),
// //               child: Row(children:const [
// //                 SizedBox(
// //                   width: 30 / 2,
// //                 ),
// //                 Icon(Icons.star,
// //                     size: 50, color: Color.fromARGB(255, 255, 123, 0))
// //               ]),
// //             ),
// //             Container(
// //               width: 200,
// //               height: 200,
// //               padding:
// //                   EdgeInsets.only(top: 15, bottom: 20, left: 60, right: 10),
// //               child: BigText(text: "Canjear", color: Colors.white),
// //               decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(20),
// //                   color: Color(0xff5D4FB1),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey[850]!.withOpacity(0.10),
// //                       offset: const Offset(-10, 10),
// //                       blurRadius: 10,
// //                     )
// //                   ]),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
