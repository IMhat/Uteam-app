import 'dart:convert';
// import 'dart:ffi';

class Point {
  late String? username;
  late String? description;
  late String? point;
  // late dynamic date;
  late String? id;
  // late Bool? done;
  Point(this.username, this.description, this.point, this.id
      // this.done,
      );

  factory Point.fromJson(String str) => Point.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Point.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    description = map['description'];
    point = map['point'];
    // date = map['date'];
    id = map['id'];
    // done = map['done'];
  }

  Map<String, dynamic> toMap() => {
        "username": username,
        "description": description,
        "point": point,
        // "date": date,
        "id": id
        // "done": done,
      };

  Point copy() => Point(username, description, point, id
      // done,

      );

  then(Null Function(dynamic value) param0) {}
}
