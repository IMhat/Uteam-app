import 'dart:convert';

class User {
  late String name;
  late String lastName;
  late String email;
  late dynamic phone;
  late String type;
  late String userImage;
  late dynamic points;
  late dynamic due;
  late String id;
  User(
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.type,
    this.userImage,
    this.points,
    this.due,
    this.id,
  );
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    lastName = map['lastName'];
    email = map['email'];
    phone = map['phone'];
    type = map['type'];
    userImage = map['userImage'];
    points = map['points'];
    due = map['due'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "type": type,
        "userImage": userImage,
        "points": points,
        "due": due,
        "id": id,
      };

  User copy() => User(
        name,
        lastName,
        email,
        phone,
        type,
        userImage,
        points,
        due,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
