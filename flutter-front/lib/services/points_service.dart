import 'dart:convert';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/points_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PointService extends ChangeNotifier {
  final String _baseUrl = '2qufsr9dx5.execute-api.us-east-1.amazonaws.com';

  List<Point> points = [];

  List<Point> userPoints = [];

  late Point selectedPoint;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  PointService() {
    // _dbProvider = DBProvider();
    loadPoints();
  }

  Future<String?> updatePoint(Point point) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'points/${point.id}');
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
    final url = Uri.https(_baseUrl, 'points/${point.id}');
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
    final url = Uri.https(_baseUrl, 'points');
    final resp = await http.get(url);
    final Map<String, dynamic> pointsMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);
    for (var item in jsonData["body"]["points"]) {
      points.add(Point(
          item["username"], item["description"], item["point"], item["id"]));

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

  Future<List<Point>> getPoint(Point point) async {
    isLoading = true;
    final url = Uri.https(_baseUrl, 'points/user/${point.username}');
    final resp = await http.get(url);
    final Map<String, dynamic> pointsMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData["body"]["points/user/${point.username}"]) {
      userPoints.add(Point(
          item["username"], item["description"], item["point"], item["id"]));

      // _dbProvider.getTodasLasTasks();
      // _dbProvider.loadPoints(TaskModel(
      //     id: item["id"],
      //     title: item["title"],
      //     description: item["description"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return userPoints;
  }

  Future<http.Response> savePoints(String text, String text2, String text3) {
    return http.post(
      Uri.parse(
          'https://2qufsr9dx5.execute-api.us-east-1.amazonaws.com/points'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': text,
        'description': text2,
        'point': text3,
        // 'date': text4,
        // 'done': text5
      }),
    );
  }
}
