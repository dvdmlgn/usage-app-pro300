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
      id: json['id'],
      productId: json['productId'],
      name: json['name'],
      quantity: json['quantity'],
    );
  }

}