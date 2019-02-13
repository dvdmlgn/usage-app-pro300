import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';

var products = <Product>[];
var consumables = <Consumable>[];
var groceries = <Grocery>[];

var i1 = new Consumable(productId: "1", name: 'Apple', quantity: 2);
var i2 = new Consumable(productId: "2", name: 'Banana', quantity: 3);
var i3 = new Consumable(productId: "3", name: 'Carrot', quantity: 5);
var i4 = new Consumable(productId: "4", name: 'Date', quantity: 7);
var i5 = new Consumable(productId: "5", name: 'Grapes', quantity: 11);
var i6 = new Consumable(productId: "6", name: 'Lemon', quantity: 13);

void fillList() {
  consumables.add(i1);
  consumables.add(i2);
  consumables.add(i3);
  consumables.add(i4);
  consumables.add(i5);
  consumables.add(i6);
}
