// import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/transaction.dart';

import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 30, bottom: 50),
        width: 500,
        height: 80,
        //decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _UserDetails(
              //title: taskListProvider.tasks[i].title,
              // subTitle: taskListProvider.tasks[i].description,
              name: transaction.trnxSummary,
              points: transaction.amount,
              summary: transaction.summary,
            ),
          ],
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

class _UserDetails extends StatefulWidget {
  final dynamic name;
  final dynamic points;
  final dynamic summary;

  const _UserDetails({this.name, this.points, this.summary});

  @override
  State<_UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<_UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 80,
        height: 70,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 231, 170, 209),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.points.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.summary.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.indigo,
  //     borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}
