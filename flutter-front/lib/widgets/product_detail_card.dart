import 'package:app_uteam/models/models.dart';
import 'package:flutter/material.dart';
import 'BigText.dart';
import 'SmallText.dart';
import 'icon_and_text_widget.dart';

class ProductDetailCard extends StatelessWidget {
  final Product product;

  const ProductDetailCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            // createAt: product.createAt
          ),
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

  // final String? createAt;

  const _ProductDetailCard({
    this.title,
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
                                        child: const Text(
                                          "Canjear",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
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
}
