import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.productName,
    this.productImage,
    this.description,
    this.points,
    // this.createAt,
  });

  dynamic id;
  dynamic productName;
  dynamic productImage;
  dynamic description;
  dynamic points;
  // dynamic createAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        productName: json['productName'],
        productImage: json['productImage'],
        description: json['description'],
        points: json['points'],
        // createAt: json['createAt'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productImage": productImage,
        "description": description,
        "points": points,
        // "createAt": createAt
      };
}
