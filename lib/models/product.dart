import '../backend/miscella.dart';

class Product {
  String id;
  String name;

  Product({this.name}) {
    id = newId();
  }

  Product.cache({this.id, this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product.cache(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name
  };

  String jsonify() => toJson().toString();

}