import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/transaction.dart';
import 'package:app_uteam/providers/buy_transaction_form_provider.dart';
import 'package:app_uteam/services/buyProduct_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/wallet.dart';
import 'BigText.dart';
import 'SmallText.dart';
import 'icon_and_text_widget.dart';

import 'package:app_uteam/widgets/my_globals.dart';

class ProductDetailCard extends StatelessWidget {
  final Product product;
  final Wallet wallet;
  final us = globalVariable.uss;

  ProductDetailCard({Key? key, required this.product, required this.wallet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Transaction = Provider.of<BuyTransactionFormProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Uteam points'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: 880,
          height: 880,
          margin: const EdgeInsets.only(
            top: 60,
          ),
          child: _ProductDetailCard(
              title: product.title,
              productImage: product.productImage,
              description: product.description,
              points: product.points,
              username: wallet.username,
              // createAt: product.createAt
              onTap: () {
                // BuyProductService().saveBuyProductTransaction(
                //     product.points, us, product.title);
                (() {
                  Transaction.transaction
                      .updatedAt(product.points, product.title);
                });
              }),
        ));
  }

  // BoxDecoration _cardBorders() => BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(25),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
  //         ]);
}

class _ProductDetailCard extends StatefulWidget {
  final String? title;
  final String? productImage;
  final String? description;
  final dynamic points;

  final String? username;

  // final String? createAt;

  const _ProductDetailCard({
    required this.onTap,
    this.title,
    this.productImage,
    this.description,
    this.points,
    this.username,

    // this.createAt
  });
  final VoidCallback onTap;
  @override
  State<_ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<_ProductDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //backgroundimage
                Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.productImage.toString())
                          //  AssetImage("assets/remera.jpg")
                          )),
                ),
                //icon widget

                //introduction of product
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey),
                      ],
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            text: widget.title.toString(),
                            size: 26,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                            text: "Recompensa",
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: "Normal",
                                  iconColor: Colors.blue),
                              const SizedBox(
                                width: 55,
                              ),
                              IconAndTextWidget(
                                  icon: Icons.price_change_rounded,
                                  text: widget.points,
                                  iconColor: Colors.blue),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BigText(text: "Descripcion"),
                          SmallText(text: widget.description.toString()),
                          SizedBox(
                            width: 300,
                            height: 90,
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 20, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20 * 2),
                                    topRight: Radius.circular(20 * 2),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.grey[850]!.withOpacity(0.80),
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 0,
                                      bottom: 20,
                                      left: 20,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Row(children: const [
                                      SizedBox(
                                        width: 30 / 2,
                                      ),
                                      Icon(Icons.star,
                                          size: 50,
                                          color:
                                              Color.fromARGB(255, 255, 123, 0))
                                    ]),
                                  ),
                                  Container(
                                      width: 150,
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                          top: 1, bottom: 1, left: 1, right: 1),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xff5D4FB1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[850]!
                                                  .withOpacity(0.10),
                                              offset: const Offset(-10, 10),
                                              blurRadius: 10,
                                            )
                                          ]),
                                      child: TextButton(
                                        child: Text(
                                          "Canjear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          widget.onTap();
                                          BuyProductService().saveTransactions(
                                              widget.points,
                                              widget.username,
                                              widget.title);

                                          //  Navigator.of(context).pushNamed(succefullyBuy.route);
                                        },
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //expandable text widget
              ],
            ),
          ),
        ));
  }
}
