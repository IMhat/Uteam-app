import 'dart:ui';

import 'package:app_uteam/screens/popular_recompensas.dart';
import 'package:app_uteam/screens/products_screen.dart';
import 'package:app_uteam/widgets/SmallText.dart';
import 'package:app_uteam/widgets/app_column.dart';
import 'package:app_uteam/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../widgets/BigText.dart';

import 'package:app_uteam/models/product.dart';
import 'package:app_uteam/models/product_model.dart';
import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/widgets/product_card.dart';
import 'package:app_uteam/providers/product_list_provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 170, 209),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 200,
                height: 150,
                child: Image.asset("assets/paint1.png"),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 170, 209),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 200,
                height: 150,
                child: Image.asset("assets/paint2.png"),
              )
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          width: 300,
          height: 60,
          color: Colors.white,
          child: const Text(
            "Objetivos a alcanzar",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Diseño UX"),
              Icon(Icons.change_circle),
              Text("80/100"),
            ],
          ),
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          width: 300,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[850]!.withOpacity(0.29),
                  offset: const Offset(-10, 10),
                  blurRadius: 10,
                )
              ]),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Desafios",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 239, 53, 121)),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.red,
              )
            ],
          ),
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          width: 300,
          height: 80,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 170, 209),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[850]!.withOpacity(0.29),
                  offset: const Offset(-10, 10),
                  blurRadius: 10,
                )
              ]),
        )

        // Recompensas Populares

        //list product
        // Container(height: 200, child: PopularScreen())

        // Container(
        //   height: 900,
        //   child:
        // ListView.builder(
        //     physics: NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        //         child: Row(
        //           children: [
        //             //image section
        //             Container(
        //               width: 120,
        //               height: 120,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(20),
        //                   color: Color.fromARGB(255, 190, 190, 190),
        //                   image: DecorationImage(
        //                       fit: BoxFit.cover,
        //                       image: AssetImage("assets/remera.jpg"))),
        //             ),
        //             //text container
        //             Expanded(
        //               child: Container(
        //                 height: 100,
        //                 // width: 200,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.only(
        //                       topRight: Radius.circular(20),
        //                       bottomRight: Radius.circular(20)),
        //                   color: Colors.grey[200],
        //                 ),
        //                 child: Padding(
        //                   padding: EdgeInsets.only(left: 10, right: 10),
        //                   child: AppColumn(
        //                     text: "Remera de uteam",
        //                   ),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       );
        //     }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color.fromARGB(255, 137, 205, 236),
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Canjea Puntos",
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 15, right: 100),
                    child: Column(
                      children: [
                        MaterialButton(
                          minWidth: 120.0,
                          height: 40.0,
                          onPressed: (() {}),
                          color: Color.fromARGB(255, 251, 110, 2),
                          child: Text(
                            "Empezar",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
