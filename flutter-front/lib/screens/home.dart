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
                color: const Color(0xff5D4FB1),
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
                          "Hola Uteam",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Completa objetivos",
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.task,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 80, right: 5),
                        child: Row(
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Color(0xff5D4FB1),
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
                height: 120,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                        text: "Completado hoy",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(1, (index) {
                              return const Icon(
                                Icons.timelapse,
                                size: 50,
                                color: Colors.black,
                              );
                            }),
                          ),
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
                                color: Colors.black,
                                child: const LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Color.fromARGB(255, 13, 52, 83)),
                                  backgroundColor: Colors.blueGrey,
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










// import 'package:app_uteam/screens/home_page_body.dart';
// import 'package:app_uteam/screens/product_details.dart';
// import 'package:app_uteam/widgets/BigText.dart';
// import 'package:app_uteam/widgets/SmallText.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   // @override
//   // State<HomePage> createState() => _HomePageState();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Container(
//               child: Container(
//                   margin: EdgeInsets.only(top: 45, bottom: 15),
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           BigText(
//                             text: "Hola Uteam",
//                             size: 30,
//                           ),
//                           Row(
//                             children: [
//                               SmallText(
//                                 text: "dev",
//                                 color: Colors.black,
//                               ),
//                               Icon(Icons.arrow_drop_down_rounded)
//                             ],
//                           )
//                         ],
//                       ),
//                       Center(
//                         child: Container(
//                           width: 45,
//                           height: 45,
//                           child: Icon(Icons.person_outline_sharp,
//                               color: Colors.white),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.blue,
//                           ),
//                         ),
//                       )
//                     ],
//                   )),
//             ),
//             Expanded(child: SingleChildScrollView(child: HomePageBody())),
//             // Expanded(child: SingleChildScrollView(child: AcercaDe())),
//           ],
//         ));
//   }
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Container(
//               child: Container(
//                   margin: EdgeInsets.only(top: 45, bottom: 15),
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           BigText(
//                             text: "Hola Uteam",
//                             size: 30,
//                           ),
//                           Row(
//                             children: [
//                               SmallText(
//                                 text: "dev",
//                                 color: Colors.black,
//                               ),
//                               Icon(Icons.arrow_drop_down_rounded)
//                             ],
//                           )
//                         ],
//                       ),
//                       Center(
//                         child: Container(
//                           width: 45,
//                           height: 45,
//                           child: Icon(Icons.person_outline_sharp,
//                               color: Colors.white),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.blue,
//                           ),
//                         ),
//                       )
//                     ],
//                   )),
//             ),
//             Expanded(child: SingleChildScrollView(child: HomePageBody())),
//             // Expanded(child: SingleChildScrollView(child: AcercaDe())),
//           ],
//         ));
//   }
// }

