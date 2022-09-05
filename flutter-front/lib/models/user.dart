import 'dart:convert';

class User {
  late String username;
  late String email;
  late String points;
  late String id;
  User(
    this.username,
    this.email,
    this.points,
    this.id,
  );
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  User.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    email = map['email'];
    points = map['points'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "points": points,
        "id": id,
      };

  User copy() => User(
        username,
        email,
        points,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
