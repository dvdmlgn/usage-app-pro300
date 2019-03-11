// import 'dart:convert';
import 'package:usage/backend/miscella.dart';

class Product {
  String id;

  Product() {
    id = generateId(dataType: 'product');
  }

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  String jsonify() => toJson().toString();
}
