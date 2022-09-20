import 'dart:convert';
// import 'dart:ffi';

class Point {
  late String? user;
  late String? actualBalance;
  late String? transactions;
  // late dynamic date;
  late String? id;
  // late Bool? done;
  Point(this.user, this.actualBalance, this.transactions, this.id
      // this.done,
      );

  factory Point.fromJson(String str) => Point.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Point.fromMap(Map<String, dynamic> map) {
    user = map['user'];
    actualBalance = map['actualBalance'];
    transactions = map['transactions'];
    // date = map['date'];
    id = map['id'];
    // done = map['done'];
  }

  Map<String, dynamic> toMap() => {
        "user": user,
        "actualBalance": actualBalance,
        "transactions": transactions,
        // "date": date,
        "id": id
        // "done": done,
      };

  Point copy() => Point(user, actualBalance, transactions, id
      // done,

      );

  then(Null Function(dynamic value) param0) {}
}
