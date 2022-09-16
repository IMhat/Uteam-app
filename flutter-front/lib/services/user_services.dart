import 'dart:convert';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/user_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';
  List<User> users = [];
  late User selectedUser;
  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  UserService() {
    // _dbProvider = DBProvider();
    loadUsers();
  }

  Future<String> updateUser(User user) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/users/${user.id}');
    final resp = await http.put(url, body: user.toJson());
    final decodeData = resp.body;
    final index = users.indexWhere((element) => element.id == user.id);
    users[index] = user;
    // _dbProvider.updateUser(UserModel(
    //   id: user.id,
    //   username: user.username,
    //   points: user.points,
    //   email: user.email,
    // ));
    notifyListeners();
    return user.id;
  }

  Future<String> deleteUser(User user) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/users/${user.id}');
    final resp = await http.delete(url, body: user.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    // _dbProvider.deleteUser(user.id);
    notifyListeners();
    return user.id;
  }

  Future<List<User>> loadUsers() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, '/api/users');
    final resp = await http.get(url);
    final List<dynamic> usersMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);
    for (var item in jsonData) {
      users.add(User(
          item["name"],
          item["lastName"],
          item["email"],
          item["phone"],
          item["type"],
          item["userImage"],
          item["due"],
          item["points"],
          item["id"]));
      // _dbProvider.getTodasLasTasks();
      // _dbProvider.nuevoUser(UserModel(
      //     id: item["id"],
      //     username: item["username"],
      //     points: item["points"],
      //     email: item["email"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return users;
  }

  // Future<String> getUser(User user) async {
  //   notifyListeners();
  //   final url = Uri.https(_baseUrl, 'users/${user.id}');
  //   final resp = await http.get(url);
  //   final Map<String, dynamic> usermap = jsonDecode(resp.body);
  //   final jsonData = jsonDecode(resp.body);
  //   final index = users.indexWhere((element) => element.id == user.id);
  //   users[index] = user;
  //   // _dbProvider.updateUser(UserModel(
  //   //   id: user.id,
  //   //   username: user.username,
  //   //   points: user.points,
  //   //   email: user.email,
  //   // ));
  //   notifyListeners();
  //   return user.id;
  // }

  Future<http.Response> saveUsers(String text, String text2, String text3,
      dynamic text4, String text5, String text6, dynamic text7, dynamic text8) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': text,
        'lastName': text2,
        'email': text3,
        'phone': text4,
        'type': text5,
        'userImage': text6,
        'points': text7,
        'due': text8,
      }),
    );
  }
}
