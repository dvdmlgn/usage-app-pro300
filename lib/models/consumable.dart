import 'dart:convert';

import 'package:usage/backend/miscella.dart';

class Consumable {
  String id;
  String productId;
  String name;
  double quantity;
  String expiry;
  String description;
  String imageUrl;

  Consumable(
      {this.productId,
      this.name,
      this.quantity,
      this.expiry,
      this.description,
      this.imageUrl}) {
    id = newId();
  }

  Consumable.cache(
      {this.id,
      this.productId,
      this.name,
      this.quantity,
      this.expiry,
      this.description,
      this.imageUrl});

  factory Consumable.fromJson(Map<String, dynamic> json) {
    return Consumable.cache(
        id: json['id'],
        productId: json['productId'],
        name: json['name'],
        quantity: json['quantity'],
        expiry: json['expiry'],
        description: json['description'],
        imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'name': name,
        'quantity': quantity,
        'expiry': expiry,
        'description': description,
        'imageUrl': imageUrl
      };

  String jsonify() => toJson().toString();

  String stringify() => json.encode(toJson());
}
