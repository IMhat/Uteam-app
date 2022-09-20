import 'package:app_uteam/models/models.dart';
import 'package:flutter/material.dart';

class MyUserCard extends StatelessWidget {
  final User user;

  const MyUserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(top: 0, right: 5),
      child: _MyUserCardDetails(
        //title: taskListProvider.tasks[i].title,
        // subTitle: taskListProvider.tasks[i].description,
        name: user.name,
        points: user.points,
        //email: user.email,
      ),
    );
  }
}

class _MyUserCardDetails extends StatefulWidget {
  final String? name;
  final dynamic points;
  //final String? email;

  const _MyUserCardDetails({this.points, this.name});

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
          //   widget.name.toString(),
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
                fontSize: 20, color: Color.fromARGB(255, 255, 0, 0)),
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
                color: Color.fromARGB(255, 252, 2, 2),
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
      color: Color.fromARGB(255, 232, 203, 221),
      borderRadius: BorderRadius.all(Radius.circular(20)));
}
