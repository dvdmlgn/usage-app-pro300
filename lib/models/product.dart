import 'package:usage/backend/miscella.dart';

class Product {
  String id;
  String name;

  Product({this.name}) {
    id = generateId(dataType: 'product');
  }

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  String jsonify() => toJson().toString();
}
