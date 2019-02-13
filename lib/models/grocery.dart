import '../backend/miscella.dart';

class Grocery {
  String id;
  String productId;
  bool inBasket;

  Grocery({this.productId}) {
    id = newId();
    inBasket = false;
  }


  // maybe make this a private method
  // @toInvestigate : later, after we do local storage 
  Grocery.cache({this.id, this.productId, this.inBasket});

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery.cache(
      id: json['id'],
      productId: json['productId'],
      inBasket: json['inBasket']
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'productId' : productId,
    'inBasket' : inBasket
  };

  String jsonify() => toJson().toString();


}