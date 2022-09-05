import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyUserCard extends StatelessWidget {
  final User user;

  const MyUserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userListProvider =
        Provider.of<UserListProvider>(context, listen: false);
    return Container(
      width: 80,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: _MyUserCardDetails(
        //title: taskListProvider.tasks[i].title,
        // subTitle: taskListProvider.tasks[i].description,
        // username: user.username,
        points: user.points,
        //email: user.email,
      ),
    );
  }
}

class _MyUserCardDetails extends StatefulWidget {
  // final String? username;
  final String? points;
  //final String? email;

  const _MyUserCardDetails({this.points});

  @override
  State<_MyUserCardDetails> createState() => _MyUserCardDetailsState();
}

class _MyUserCardDetailsState extends State<_MyUserCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.username.toString(),
          //   style: const TextStyle(
          //       fontSize: 20,
          //       color: Color.fromARGB(255, 252, 252, 252),
          //       fontWeight: FontWeight.bold),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          Text(
            widget.points.toString(),
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 251, 110, 2)),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
              10,
            ))),
            child: const Text(
              "Puntos",
              style: TextStyle(
                fontSize: 10,
                color: const Color.fromARGB(255, 251, 110, 2),
              ),
            ),
          )
          // Text(
          //   widget.email.toString(),
          //   style: const TextStyle(
          //       fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),
          // ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Color.fromARGB(255, 240, 221, 206),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}



// import 'package:app_uteam/models/models.dart';
// import 'package:app_uteam/providers/user_list_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:app_uteam/models/models.dart';
// import 'package:app_uteam/providers/user_list_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyUserCard extends StatelessWidget {
//   final User user;

//   const MyUserCard({Key? key, required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final userListProvider =
//     //     Provider.of<UserListProvider>(context, listen: false);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         margin: const EdgeInsets.only(top: 20, bottom: 50),
//         width: double.infinity,
//         height: 220,
//         //decoration: _cardBorders(),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             _bodyDetails(),
//             _MyUserCardDetails(
//               //title: taskListProvider.tasks[i].title,
//               // subTitle: taskListProvider.tasks[i].description,
//               // username: user.username,
//               points: user.points,
//               // email: user.email,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // BoxDecoration _cardBorders() => BoxDecoration(
//   //         color: Colors.white,
//   //         borderRadius: BorderRadius.circular(25),
//   //         boxShadow: [
//   //           BoxShadow(
//   //               color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
//   //         ]);
// }

// class _MyUserCardDetails extends StatefulWidget {
//   // final String? username;
//   final String? points;
//   // final String? email;

//   const _MyUserCardDetails(
//       {
//       // this.username,
//       //  this.email,
//       this.points});

//   @override
//   State<_MyUserCardDetails> createState() => _MyUserCardDetailsState();
// }

// class _MyUserCardDetailsState extends State<_MyUserCardDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         width: double.infinity,
//         height: 79,
//         decoration: _buildBoxDecoration(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Text(
//             //   widget.username.toString(),
//             //   style: const TextStyle(
//             //       fontSize: 20,
//             //       color: Colors.white,
//             //       fontWeight: FontWeight.bold),
//             //   maxLines: 1,
//             //   overflow: TextOverflow.ellipsis,
//             // ),
//             Text(
//               widget.points.toString(),
//               style: const TextStyle(fontSize: 15, color: Colors.white),
//             ),
//             // Text(
//             //   widget.email.toString(),
//             //   style: const TextStyle(fontSize: 15, color: Colors.white),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _buildBoxDecoration() => const BoxDecoration(
//       color: Colors.indigo,
//       borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
// }

// class _bodyDetails extends StatefulWidget {
//   // final String? username;
//   // final String? points;
//   // final String? email;

//   const _bodyDetails();

//   @override
//   State<_bodyDetails> createState() => _bodyDetailsState();
// }

// class _bodyDetailsState extends State<_bodyDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Uteam Points'),
//       // ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               _crearCard1(),
//               // _container1(),
//               // _crearCard2(),
//               // _crearCard3(),
//               // _crearCard4(),
//               // _crearCard5()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _crearCard1() {
//     return Card(
//       elevation: 5,
//       color: Colors.deepPurple,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//       child: Container(
//         child: Column(
//           // ignore: prefer_const_literals_to_create_immutables
//           children: <Widget>[
//             CircleAvatar(
//               radius: 50.0,
//               backgroundColor: Colors.grey,
//               backgroundImage: AssetImage('assets/usuario.jpg'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _crearCard2() {
//     return Card(
//         elevation: 5,
//         child: Container(
//             child: Image.asset(
//               'assets/remera.jpg',
//               width: 200,
//             ),
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple,
//               borderRadius: BorderRadius.circular(5),
//             )));
//   }
// }

// Widget _crearCard3() {
//   return Card(
//       elevation: 5,
//       child: Container(
//           child: Image.asset(
//             'assets/mochilas.jpg',
//             width: 200,
//           ),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           decoration: BoxDecoration(
//             color: Colors.deepPurple,
//             borderRadius: BorderRadius.circular(5),
//           )));
// }

// Widget _crearCard4() {
//   return Card(
//       elevation: 5,
//       child: Container(
//           child: Image.asset(
//             'assets/tazas.jpg',
//             width: 200,
//           ),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           decoration: BoxDecoration(
//             color: Colors.deepPurple,
//             borderRadius: BorderRadius.circular(5),
//           )));
// }

// Widget _crearCard5() {
//   return Card(
//       elevation: 5,
//       child: Container(
//           child: Image.asset(
//             'assets/relojes.jpg',
//             height: 180,
//             width: 180,
//           ),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//           decoration: BoxDecoration(
//             color: Colors.deepPurple,
//             borderRadius: BorderRadius.circular(5),
//           )));
// }

// // _container1() {
// //   return Container(
// //     padding: const EdgeInsets.all(8.0),
// //     child: Container(
// //       width: 200,
// //       height: 80,
// //       decoration: BoxDecoration(
// //         color: Color.fromARGB(255, 84, 33, 173),
// //       ),
// //       child: Column(
// //         children: [
// //           Text(
// //             '¡Tienes 150 puntos!',
// //             style: TextStyle(fontSize: 20, color: Colors.white),
// //           )
// //         ],
// //       ),
// //     ),
// //   );
// // }