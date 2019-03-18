import '../backend/miscella.dart';

class Grocery {
  String id;
  String productId;
  bool inBasket;
  String name;
  double quantity;
  String expiry;
  String description;
  String imageUrl;
  Grocery(
      {this.productId,
      this.name,
      this.quantity,
      this.expiry,
      this.description,
      this.imageUrl}) {
    id = generateId(dataType: 'grocery');
    inBasket = false;
  }

  // maybe make this a private method
  // @toInvestigate : later, after we do local storage
  Grocery.cache(
      {this.id,
      this.productId,
      this.inBasket,
      this.name,
      this.quantity,
      this.expiry,
      this.description,
      this.imageUrl});

  Grocery.undo(Grocery grocery);

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery.cache(
        id: json['id'],
        productId: json['productId'],
        inBasket: json['inBasket'],
        name: json['name'],
        quantity: json['quantity'],
        expiry: json['expiry'],
        description: json['description'],
        imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'inBasket': inBasket,
        'name': name,
        'quantity': quantity,
        'expiry': expiry,
        'description': description,
        'imageUrl': imageUrl
      };

  String jsonify() => toJson().toString();
}
