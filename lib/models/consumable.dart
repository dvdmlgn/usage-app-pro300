import 'dart:convert';
import 'package:flutter/material.dart';
import '../backend/miscella.dart';

class Consumable {
  String id;
  String productId;
  String name;
  double quantity;

  Consumable({this.productId, this.name, this.quantity}) {
    id = newId();
  } 

  // maybe make this a private method
  // @toInvestigate : later, after we do local storage 
  Consumable.cache({this.id, this.productId, this.name, this.quantity}); 

  factory Consumable.fromJson(Map<String, dynamic> json) {
    return Consumable.cache(
      id:        json['id'],
      productId: json['productId'],
      name:      json['name'],
      quantity:  json['quantity'],
    );
  }

  // static Consumable fromJson(String text) {
  //   debugPrint('before jsonDecode');
  //   Map<String, dynamic> json = jsonDecode(text);
  //   debugPrint('after jsonDecode');
    
  //   return Consumable.cache(
  //     id: json['id'],
  //     productId: json['productId'],
  //     name: json['name'],
  //     quantity: json['quantity'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //   '"id"' : '"$id"',
  //   '"productId"' : '"$productId"',
  //   '"name"' : '"$name"',
  //   '"quantity"' : quantity,
  // };

  Map<String, dynamic> toJson() => {
    'id' : id,
    'productId' : productId,
    'name' : name,
    'quantity' : quantity,
  };

  // String toJson() {
  //   return """{"id":"$id","productId":"$productId","name":"$name","quantity":$quantity}""";
  // }

  // String toJson() => jsonEncode(this);

  String jsonify() => toJson().toString();

  String stringify() => json.encode( toJson() );

  // static String listToJson(List<Consumable> list) {
  //   String json = '[';

  //   // for(var consumable in list) {
  //   //   json += consumable.toJson();
  //   //   json += ',';
  //   // }

  //   // json = json.substring(0, json.length);

  //   for (int i = 0; i < list.length; i++) {
  //     json += list[i].toJson();
  //     if (i < list.length -1) json += ',';
  //   }

  //   json += ']';

  //   return json;
  // }

}