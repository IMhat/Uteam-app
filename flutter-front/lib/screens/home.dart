import 'dart:ui';

import 'package:app_uteam/screens/home_page_body.dart';
import 'package:app_uteam/screens/product_details.dart';
import 'package:app_uteam/widgets/BigText.dart';
import 'package:app_uteam/widgets/SmallText.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // @override
  // State<HomePage> createState() => _HomePageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topEnd,
                        colors: [
                      Colors.deepPurple,
                      Color.fromARGB(255, 245, 98, 130)
                    ])),
                height: 220,
                margin: const EdgeInsets.only(top: 0, bottom: 15),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Disponible",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              "300 Puntos",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 45, left: 5),
                          child: Icon(
                            Icons.notifications_active_rounded,
                            size: 40,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, right: 5),
                        child: Row(
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor:
                                      Color.fromARGB(255, 211, 211, 211),
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 110,
                margin: const EdgeInsets.only(
                    top: 150, left: 30, right: 30, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e88888888),
                          blurRadius: 10.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mis objetivos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            "Mis objetivos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("60/100"),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: SizedBox(
                              width: 150,
                              height: 20,
                              child: Container(
                                color: Color.fromARGB(255, 243, 166, 230),
                                child: const LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Color.fromARGB(255, 209, 174, 243)),
                                  backgroundColor:
                                      Color.fromARGB(255, 242, 176, 218),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Expanded(child: SingleChildScrollView(child: AcercaDe())),
          ],
        ),
      ),
    );
  }
}
