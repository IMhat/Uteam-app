import 'dart:convert';
import 'dart:ffi';

PointModel taskModelFromJson(String str) =>
    PointModel.fromJson(json.decode(str));
String taskModelToJson(PointModel data) => json.encode(data.toJson());

class PointModel {
  PointModel({this.username, this.description, this.point, this.id
      // this.done,
      });

  String? username;
  String? description;
  String? point;
  // dynamic date;
  String? id;
  // Bool? done;

  factory PointModel.fromJson(Map<String, dynamic> json) => PointModel(
      username: json["username"],
      description: json["description"],
      point: json["point"],
      // date: json["date"],
      id: json["id"]
      // done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "description": description,
        "point": point,
        // "date": date,
        "id": id
        // "done": done,
      };
}
