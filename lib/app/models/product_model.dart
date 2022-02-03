import 'dart:convert';

class ProductModel {
  int id;
  String name;
  String description;
  double price;
  String image;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image});

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    price: json['price'],
    image: json['image']
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': image
    };
  }
}
