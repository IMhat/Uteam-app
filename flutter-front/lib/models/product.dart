import 'dart:convert';
import 'dart:ffi';

class Product {
  late String id;
  late String productName;
  late String productImage;
  late String description;
  late dynamic points;
  // late String createAt;
  Product(
    this.id,
    this.productName,
    this.productImage,
    this.description,
    this.points,
    //  this.createAt
  );
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    productName = map['productName'];
    productImage = map['productImage'];
    description = map['description'];
    points = map['points'];
    // createAt = map['createAt'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "productName": productName,
        "productImage": productImage,
        "description": description,
        "points": points,
        // "createAt": createAt
      };

  Product copy() => Product(id, productName, productImage, description, points);

  then(Null Function(dynamic value) param0) {}
}
