import 'dart:convert';

import 'package:app_uteam/models/task_inprogress.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskInprogressService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';

  List<TaskInprogress> taskInprogress = [];

  late TaskInprogress selectedTask;
  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  TaskInprogressService() {
    // _dbProvider = DBProvider();
    loadTasks();
  }

  Future<String> updateTask(TaskInprogress task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/tasks/${task.id}');
    final resp = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "type": task.type,
      }),
    );

    final decodeData = resp.body;
    final index = taskInprogress.indexWhere((element) => element.id == task.id);
    taskInprogress[index] = task;

    // _dbProvider.updateTask(TaskModel(
    //     id: task.id, title: task.title, description: task.description));
    notifyListeners();
    return task.id;
  }

  Future<String> deleteTask(TaskInprogress task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/tasks/${task.id}');
    final resp = await http.delete(url, body: task.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    // _dbProvider.deleteTask(task.id);
    notifyListeners();
    return task.id;
  }

  Future<List<TaskInprogress>> loadTasks() async {
    isLoading = true;
    final url = Uri.https(
        _baseUrl, '/api/tasks/inprogress/search', {'searchQuery': 'david'});
    final resp = await http.get(url);
    final List<dynamic> tasksMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      taskInprogress.add(TaskInprogress(
          item["title"],
          item["type"],
          item["priority"],
          item["description"],
          item["user"],
          item["points"],
          item["done"],
          item["id"]));
      // _dbProvider.getTodasLasTasks();
      // _dbProvider.nuevaTask(TaskModel(
      //     id: item["id"],
      //     title: item["title"],
      //     description: item["description"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return taskInprogress;
  }

  Future<http.Response> saveTasks(String text, String text2, String text3,
      String text4, String text5, dynamic text6, dynamic text7) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': text,
        'type': text2,
        'priority': text3,
        'description': text4,
        'user': text5,
        'points': text6,
        'done': text7,
      }),
    );
  }
}
