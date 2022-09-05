import 'dart:ffi';

import 'package:app_uteam/models/points_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';

class PointListProvider extends ChangeNotifier {
  List<PointModel> points = [];

  //set tasks(List<TaskModel> tasks) {}

  Future<PointModel> nuevaPoint(
      String username, String description, String points) async {
    final nuevaPoint = PointModel(
      username: username,
      description: description,
      point: points,
      // date: date,
      // id: id
      // done: done
    );
    // final id = (await DBProvider.db.nuevaPoint(nuevaPoint));
    // Asignar el ID de la base de datos al modelo
    // nuevaPoint.id = id.toString();

    this.points.add(nuevaPoint);
    notifyListeners();

    return nuevaPoint;
  }

  cargarPoints() async {
    // final points = await DBProvider.db.getTodasLasPoints();
    this.points = [...points];
    print(points);
    notifyListeners();
  }

  borrarTodos() async {
    // await DBProvider.db.deleteAllPoints();
    this.points = [];
    notifyListeners();
  }

  borrarPointPorId(
    String id,
  ) async {
    // await DBProvider.db.deletePoint(id);
    this.cargarPoints();
  }
}
