import 'dart:async';

import 'package:usage/backend/transactionLog.dart';
import 'dataStore.dart';
import 'appState.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/product.dart';

class Consumables {
  static Stream<List<Consumable>> get listen =>
      AppState.consumablesSubject.stream;

  static add(Consumable newItem) {
    consumablesDummy.add(newItem);
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'create',
      dataType: 'consumable',
      oldState: 'nil',
      newState: newItem.jsonify(),
    );
  }

  static edit(int index, Consumable newData) {
    final _oldState = consumablesDummy[index];
    newData.id = _oldState.id;
    consumablesDummy[index] = newData;
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'edit',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: newData.jsonify(),
    );
  }

  static quickEdit(int index, double quantity) {
    final _oldState = consumablesDummy[index];
    consumablesDummy[index].quantity = quantity;
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'quick edit',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: consumablesDummy[index].jsonify(),
    );
  }

  static delete(int index) {
    final _oldState = consumablesDummy[index];
    consumablesDummy.removeAt(index);
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'delete',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: 'nil',
    );
  }

  static consumed(int index) {
    final _oldState = consumablesDummy[index];
    consumablesDummy.removeAt(index);
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'consumed',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: 'nil',
    );
  }

  static wasted(int index) {
    final _oldState = consumablesDummy[index];
    consumablesDummy.removeAt(index);
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'wasted',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: 'nil',
    );
  }

  static moveToShoppingList(int index) {
    // don't know if we want to add this to the transaction log
    // - david (5 - march - 19)
    final _consumable = consumablesDummy[index];
    final _grocery = Grocery(
      productId: _consumable.productId,
      name: _consumable.name,
      quantity: _consumable.quantity
    );

    consumablesDummy.removeAt(index);
    groceries.add(_grocery);
    AppState.updateConsumablesSubject();
    AppState
        .updateGroceriesSubject(); // not sure right now if we need this or not
  }
}

class Groceries {
  static Stream<List<Grocery>> get listen => AppState.groceriesSubject.stream;

  static create(Grocery item) {
    groceriesDummy.add(item);

    Transaction(
        action: 'create',
        dataType: 'grocery',
        oldState: 'nil',
        newState: item.jsonify());
  }

  static delete(String id) {
    final _index = groceriesDummy.indexWhere((element) => element.id == id);
    final _oldState = groceriesDummy[_index];
    groceriesDummy.removeAt(_index);
    AppState.updateGroceriesSubject();

    Transaction(
      action: 'delete',
      dataType: 'grocery',
      oldState: _oldState.jsonify(),
      newState: 'nil',
    );
  }

  static edit(int index, Grocery newData) {
    final _oldState = groceriesDummy[index];
    newData.id = _oldState.id;
    groceriesDummy[index] = newData;
    AppState.updateGroceriesSubject();

    Transaction(
      action: 'edit',
      dataType: 'grocery',
      oldState: _oldState.jsonify(),
      newState: newData.jsonify(),
    );
  }

  static addToBasket(int index) {
    groceriesDummy[index].inBasket = true;
  }

  static removeFromBasket(int index) {
    groceriesDummy[index].inBasket = false;
  }

  static addToInventory(String id) {
    final _index = groceriesDummy.indexWhere((element) => element.id == id);
    final _grocery = groceriesDummy[_index];
    Groceries.delete(id);

    Consumable newConsumable =
        new Consumable(name: _grocery.name, quantity: _grocery.quantity);
    newConsumable.id = _grocery.id;
    consumablesDummy.add(newConsumable);
    AppState.updateGroceriesSubject();
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'basket to inventory',
      dataType: 'consumable',
      oldState: _grocery.jsonify(),
      // newState:
    );
  }

  static quickEdit(int index, double quantity) {
    final _oldState = groceriesDummy[index];
    groceriesDummy[index].quantity = quantity;
    AppState.updateGroceriesSubject();

    Transaction(
      action: 'quick edit',
      dataType: 'grocery',
      oldState: _oldState.jsonify(),
      newState: groceriesDummy[index].jsonify(),
    );
  }
}

class Posts {
  static Stream<List<Post>> get listenToFeed => AppState.postsSubject.stream;
  static Stream<List<Post>> get listenToSaved =>
      AppState.savedPostsSubject.stream;

  static test() {
    print("post test");
  }

  static add(Post newItem) {
    posts.add(newItem);
    AppState.updatePostsSubject();

    Transaction(
      action: 'create',
      dataType: 'post',
      oldState: 'nil',
      newState: newItem.jsonify(),
    );
  }

  static edit(int index, Post newData) {
    final _oldState = posts[index];
    newData.id = _oldState.id;
    posts[index] = newData;
    AppState.updatePostsSubject();

    Transaction(
      action: 'edit',
      dataType: 'post',
      oldState: _oldState.jsonify(),
      newState: newData.jsonify(),
    );
  }

  static delete(int index) {
    final _oldState = posts[index];
    posts.removeAt(index);
    AppState.updatePostsSubject();

    Transaction(
        action: 'delete',
        dataType: 'post',
        oldState: _oldState.jsonify(),
        newState: 'nil');
  }

  static addToSaved(int index) {
    savedPosts.add(posts[index]);
    AppState.updateSavedPostsSubject();

    // not sure if we want to add this action to the transaction log
    // - david (11 - march - 19)
  }

  static removeFromSaved(int index) {
    savedPosts.removeAt(index);
    AppState.updateSavedPostsSubject();

    // not sure if we want to add this action to the transaction log
    // - david (11 - march - 19)
  }
}

class Products {
  static Stream<List<Product>> get listen => AppState.productsSubject.stream;

  static add(Product newItem) {
    products.add(newItem);
    AppState.updatePostsSubject();

    Transaction(
      action: 'create',
      dataType: 'product',
      oldState: 'nil',
      newState: newItem.jsonify(),
    );
  }

  static edit(String id, Product newData) {
    final _index = products.indexWhere((element) => element.id == id);
    final _oldState = products[_index];
    newData.id = id;
    products[_index] = newData;
    AppState.updateProductsSubject();

    Transaction(
        action: 'edit',
        dataType: 'product',
        oldState: _oldState.jsonify(),
        newState: newData.jsonify());
  }

  static delete(String id) {
    final _index = products.indexWhere((element) => element.id == id);
    final _oldState = products[_index];
    products.removeAt(_index);
    AppState.updateProductsSubject();

    Transaction(
        action: 'edit',
        dataType: 'product',
        oldState: _oldState.jsonify(),
        newState: 'nil');
  }
}
