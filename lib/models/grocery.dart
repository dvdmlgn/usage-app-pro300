import '../backend/miscella.dart';

class Grocery {
  String id;
  String productId;

  Grocery({this.productId}) {
    id = newId();
  }


  // maybe make this a private method
  // @toInvestigate : later, after we do local storage 
  Grocery.cache({this.id, this.productId});

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery.cache(
      id: json['id'],
      productId: json['productId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'productId' : productId,
  };

  String jsonify() => toJson().toString();


}