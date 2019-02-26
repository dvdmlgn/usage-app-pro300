import '../backend/miscella.dart';

class Grocery {
  String id;
  String productId;
  bool inBasket;
  String name;
  double quantity;

  Grocery({this.productId, this.name, this.quantity}) {
    id = newId();
    inBasket = false;
  }

  // maybe make this a private method
  // @toInvestigate : later, after we do local storage
  Grocery.cache(
      {this.id, this.productId, this.inBasket, this.name, this.quantity});

  Grocery.undo(Grocery grocery) {}

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery.cache(
        id: json['id'],
        productId: json['productId'],
        inBasket: json['inBasket'],
        name: json['name'],
        quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'inBasket': inBasket,
        'name': name,
        'quantity': quantity
      };

  String jsonify() => toJson().toString();
}
