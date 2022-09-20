import 'dart:convert';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/points_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PointService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';

  List<Point> points = [];

  List<Point> userPoints = [];

  late Point selectedPoints;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  PointService() {
    // _dbProvider = DBProvider();
    loadPoints();
  }

  Future<String?> updatePoint(Point point) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/points/${point.id}');
    final resp = await http.put(url, body: point.toJson());
    final decodeData = resp.body;

    final index = points.indexWhere((element) => element.id == point.id);
    points[index] = point;

    // _dbProvider.updatePoint(PointModel(

    //     id: point.id, username: point.username, description: point.description, point: point.point, createAt: point.createAt, done: point.done);

    notifyListeners();

    return point.id;
  }

  Future<String?> deletePoint(Point point) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/points/${point.id}');
    final resp = await http.delete(url, body: point.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    // _dbProvider.deletePoint(task.id);
    notifyListeners();
    return point.id;
  }

  Future<List<Point>> loadPoints() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, '/api/points');
    final resp = await http.get(url);
    final List<dynamic> pointsMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);
    for (var item in jsonData) {
      points.add(Point(item["user"], item["actualBalance"],
          item["transactions"], item["id"]));

      // _dbProvider.getTodasLasTasks();
      // _dbProvider.loadPoints(TaskModel(
      //     id: item["id"],
      //     title: item["title"],
      //     description: item["description"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return points;
  }

  Future<http.Response> savePoints(String text, dynamic text2, dynamic text3) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/points'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user': text,
        'actualBalance': text2,
        'transactions': text3,
        // 'date': text4,
        // 'done': text5
      }),
    );
  }
}
