import 'package:app_uteam/models/models.dart';

import 'package:app_uteam/models/points_model.dart';
import 'package:app_uteam/providers/db_provider.dart';

import 'package:app_uteam/providers/point_form_provider.dart';

import 'package:app_uteam/providers/point_list_provider.dart';

import 'package:app_uteam/services/points_service.dart';

import 'package:app_uteam/widgets/point_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../services/points_service.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();

    final pointsService = Provider.of<PointService>(context);
    return ChangeNotifierProvider(
      create: (_) => PointFormProvider(pointsService.selectedPoint),
      child: _WalletScreenBody(pointsService: pointsService),
    );
  }
}

class _WalletScreenBody extends StatefulWidget {
  _WalletScreenBody({
    Key? key,
    required this.pointsService,
  }) : super(key: key);

  PointService pointsService;
  @override
  State<_WalletScreenBody> createState() => _WalletScreenBodyState();
}

class _WalletScreenBodyState extends State<_WalletScreenBody> {
  @override
  Widget build(BuildContext context) {
    PointService pointService;

    final pointListProvider = Provider.of<PointListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Mi Billetera",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "300 Puntos",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: 280,
              height: 120,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 170, 209),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: 350,
              height: 900,
              color: Colors.white,
              child: Center(
                child: ListView.builder(
                  //itemCount: taskListProvider.tasks.length,
                  itemCount: widget.pointsService.points.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      widget.pointsService.selectedPoint =
                          widget.pointsService.points[index].copy();
                      Navigator.pushNamed(
                        context,
                        'pointPut',
                      );
                    },
                    child: PointCard(
                      point: widget.pointsService.points[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
