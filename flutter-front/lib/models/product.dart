import 'dart:convert';
import 'dart:ffi';

class Product {
  late String id;
  late String? title;
  late String? type;
  late String? productImage;
  late String? description;
  late String? points;
  late String? due;
  // late String createAt;
  Product(
    this.id,
    this.title,
    this.type,
    this.productImage,
    this.description,
    this.points,
    this.due,
    //  this.createAt
  );
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    type = map['type'];
    productImage = map['productImage'];
    description = map['description'];
    points = map['points'];
    due = map['due'];
    // createAt = map['createAt'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "type": type,
        "productImage": productImage,
        "description": description,
        "points": points,
        "due": due,
        // "createAt": createAt
      };

  Product copy() =>
      Product(id, title, type, productImage, description, points, due);

  then(Null Function(dynamic value) param0) {}
}
