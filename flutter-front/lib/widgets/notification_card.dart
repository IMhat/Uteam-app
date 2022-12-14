import 'package:app_uteam/models/models.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final Point point;

  const NotificationCard({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        child: Container(
          margin: const EdgeInsets.only(top: 0, bottom: 20),
          width: double.infinity,
          height: 100,
          //decoration: _cardBorders(),
          child: Container(
            child: _NotificationDetails(
              // title: taskListProvider.tasks[i].title,
              // subTitle: pointListProvider.points[i].description,
              // username: point.username,
              // description: point.description,
              // point: point.point,
              // date: point.date,
              id: point.id,
            ),
          ),
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

class _NotificationDetails extends StatefulWidget {
  final String? username;
  final String? description;
  final String? point;
  // final dynamic date;
  final String? id;

  const _NotificationDetails(
      {this.username, this.description, this.point, this.id});

  @override
  State<_NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<_NotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[850]!.withOpacity(0.29),
                offset: const Offset(-10, 10),
                blurRadius: 10,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 210, 210),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(
                Icons.message,
                color: Colors.green,
              ),
            ),
            Column(
              children: [
                Text(
                  widget.description.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Text(
                  "Just now",
                  style: TextStyle(color: Colors.grey),
                ),
                const Icon(
                  Icons.timer,
                  color: Colors.grey,
                )
              ],
            ),
            Column(
              children: [
                const Text("Obtuviste"),
                Text(
                  widget.point.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Text("Puntos"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.white,
  //     borderRadius: BorderRadius.all(Radius.circular(10)),
  //     boxShadow: [BoxShadow(color: Colors.grey)]);
}
