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
import '../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      child: _NotificationScreenBody(pointsService: pointsService),
    );
  }
}

class _NotificationScreenBody extends StatefulWidget {
  _NotificationScreenBody({
    Key? key,
    required this.pointsService,
  }) : super(key: key);

  PointService pointsService;
  @override
  State<_NotificationScreenBody> createState() =>
      _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<_NotificationScreenBody> {
  @override
  Widget build(BuildContext context) {
    PointService pointService;

    final pointListProvider = Provider.of<PointListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Notificaciones",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
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
                    child: NotificationCard(
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
