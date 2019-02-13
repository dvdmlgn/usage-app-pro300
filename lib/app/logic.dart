import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/user.dart';

import './dataStore.dart';
import '../backend/transactionLog.dart';


class Consumables {
  
  static create(Consumable item) {
    consumables.add(item);

    Transaction(
      action: 'create',
      dataType: 'consumable',
      oldState: 'nil',
      newState: item.jsonify()
    );
  }

  static edit(int index, Consumable item) {
    final oldState = consumables[index];

    consumables.insert(index, item);

    Transaction(
      action: 'edit',
      dataType: 'consumable',
      oldState: oldState.jsonify(),
      newState: item.jsonify()
    );
  }

  static quickEdit(int index, double quantity) {
    final oldState = consumables[index];
    final newState = consumables[index];

    newState.quantity = quantity;
    consumables.insert(index, newState);

    Transaction(
      action: 'quick edit',
      dataType: 'consumable',
      oldState: oldState.jsonify(),
      newState: newState.jsonify()
    );

  }

  static delete(int index) {
    final oldState = consumables[index];

    consumables.removeAt(index);

    Transaction(
      action: 'delete',
      dataType: 'consumable',
      oldState: oldState.jsonify(),
      newState: 'nil'
    );
  }

  static consumed(int index) {
    final oldState = consumables[index];

    consumables.removeAt(index);

    Transaction(
      action: 'consumed',
      dataType: 'consumable',
      oldState: oldState.jsonify(),
      newState: 'nil'
    );
  }

  static wasted(int index) {
    final oldState = consumables[index];

    consumables.removeAt(index);

    Transaction(
      action: 'wasted',
      dataType: 'consumable',
      oldState: oldState.jsonify(),
      newState: 'nil'
    );
  }

}


class Products {

  static create(Product item) {
    products.add(item);

    Transaction(
      action: 'create',
      dataType: 'product',
      oldState: 'nil',
      newState: item.jsonify()
    );
  }

  static edit(int index, Product item) {
    final oldState = products[index];

    products.insert(index, item);

    Transaction(
      action: 'edit',
      dataType: 'product',
      oldState: oldState.jsonify(),
      newState: item.jsonify()
    );
  }

  static delete(int index) {
    final oldState = products[index];

    products.removeAt(index);

    Transaction(
      action: 'delete',
      dataType: 'product',
      oldState: oldState.jsonify(),
      newState: 'nil'
    );
  }

}


class Groceries {

  static create(Grocery item) {
    groceries.add(item);
    
    Transaction(
      action: 'create',
      dataType: 'grocery',
      oldState: 'nil',
      newState: item.jsonify()
    );
  }

  static edit(int index, Grocery item) {
    final oldState = groceries[index];

    groceries.insert(index, item);

    Transaction(
      action: 'edit',
      dataType: 'grocery',
      oldState: oldState.jsonify(),
      newState: item.jsonify()
    );
  }

  static delete(int index) {
    final oldState = groceries[index];

    groceries.removeAt(index);

    Transaction(
      action: 'deleted',
      dataType: 'grocery',
      oldState: oldState.jsonify(),
      newState: 'nil'
    );
  }

}


class Posts {

  static create(Post item) {
    posts.add(item);

    Transaction(
      action: 'create',
      dataType: 'post',
      oldState: 'nil',
      newState: item.jsonify()
    );
  }

  static edit(int index, Post item) {
    final oldState = posts[index];

    posts.add(item);

    Transaction(
      action: 'edit',
      dataType: 'post',
      oldState: oldState.jsonify(),
      newState: item.jsonify()
    );
  }

  static delete(int index) {
    final oldState = posts[index];

    posts.removeAt(index);

    Transaction(
      action: 'delete',
      dataType: 'post',
      oldState: oldState.jsonify(),
      newState: 'nil'
    );
  }

}


class Users {

  static edit(User item) {

  }

}