import 'dart:ui';

import 'package:app_uteam/models/models.dart';

import 'package:flutter/material.dart';

import '../screens/app_icon.dart';
import 'BigText.dart';
import 'SmallText.dart';
import 'app_column.dart';
import 'icon_and_text_widget.dart';

class ProductDetailCard extends StatelessWidget {
  final Product product;

  const ProductDetailCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 880,
      height: 880,
      child: Container(
        margin: const EdgeInsets.only(
          top: 0,
        ),
        width: double.infinity,
        height: double.infinity,
        child: _ProductDetailCard(
          productName: product.productName,
          productImage: product.productImage,
          description: product.description,
          points: product.points,
          // createAt: product.createAt
        ),
      ),
    );
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
  final String? productName;
  final String? productImage;
  final String? description;
  final dynamic points;

  // final String? createAt;

  const _ProductDetailCard({
    this.productName,
    this.productImage,
    this.description,
    this.points,
    // this.createAt
  });

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
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(widget.productImage.toString())
                              //  AssetImage("assets/remera.jpg")
                              )),
                    )),
                //icon widget
                Container(
                  child: Positioned(
                      top: 45,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          AppIcon(icon: Icons.arrow_back_ios),
                          Text("atras"),
                        ],
                      )),
                ),
                //introduction of product
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                                text: widget.productName.toString(),
                                size: 26,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SmallText(
                                text: "Recompensa",
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: Colors.blue),
                                  SizedBox(
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
                                height: 150,
                                child: Container(
                                  height: 120,
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 30, left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20 * 2),
                                        topRight: Radius.circular(20 * 2),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[850]!
                                              .withOpacity(0.80),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Row(children: const [
                                          SizedBox(
                                            width: 30 / 2,
                                          ),
                                          Icon(Icons.star,
                                              size: 50,
                                              color: Color.fromARGB(
                                                  255, 255, 123, 0))
                                        ]),
                                      ),
                                      Container(
                                        width: 150,
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 20,
                                            left: 40,
                                            right: 10),
                                        child: Text(
                                          "Canjear",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color(0xff5D4FB1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[850]!
                                                    .withOpacity(0.10),
                                                offset: const Offset(-10, 10),
                                                blurRadius: 10,
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),

                //expandable text widget
              ],
            ),
          ),
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: 400,
  //     height: 150,
  //     decoration: BoxDecoration(
  //         color: const Color.fromARGB(255, 255, 255, 255),
  //         borderRadius: const BorderRadius.all(Radius.circular(32)),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey[850]!.withOpacity(0.29),
  //             offset: const Offset(-10, 10),
  //             blurRadius: 10,
  //           )
  //         ]),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           color: Colors.grey,
  //           width: 90,
  //           height: 90,
  //           child: Image.network(
  //               // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnFpzAock9OwEq9Jt3m1mfDR7CLAF73Q1GYJnUJUk&s.jpg"
  //               widget.productImage.toString()),
  //         ),
  //         Column(
  //           children: [
  //             Text(
  //               widget.productName.toString(),
  //               style: const TextStyle(
  //                   fontSize: 20,
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold),
  //               maxLines: 1,
  //               overflow: TextOverflow.ellipsis,
  //             ),
  //             const Icon(Icons.person),
  //             const Text("Uteam"),
  //             Container(
  //               padding: EdgeInsets.all(8.0),
  //               width: 80,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                 color: Color(0xff5D4FB1),
  //                 borderRadius: const BorderRadius.all(Radius.circular(32)),
  //               ),
  //               child: Column(
  //                 children: <Widget>[
  //                   Column(
  //                     children: [
  //                       Text(
  //                         "Canjear",
  //                         style: TextStyle(fontSize: 18, color: Colors.white),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),

  //         Text(
  //           widget.points.toString(),
  //           style: const TextStyle(
  //               fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
  //         ),

  //         // Text(
  //         //   widget.createAt.toString(),
  //         //   style: const TextStyle(fontSize: 15, color: Colors.white),
  //         // ),
  //       ],
  //     ),
  //   );
  // }
}
