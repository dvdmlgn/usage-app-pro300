import 'package:flutter/material.dart';
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
    final _oldState = consumables[index];
    consumables[index] = newData;
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'edit',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: newData.jsonify(),
    );
  }

  static quickEdit(int index, double quantity) {
    final _oldState = consumables[index];
    consumables[index].quantity = quantity;
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'quick edit',
      dataType: 'consumable',
      oldState: _oldState.jsonify(),
      newState: consumables[index].jsonify(),
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
    final _consumable = consumables[index];
    final _grocery =
        Grocery(); // add conversion from consumable to grocery here

    consumables.removeAt(index);
    groceries.add(_grocery);
    AppState.updateConsumablesSubject();
    AppState
        .updateGroceriesSubject(); // not sure right now if we need this or not
  }
}

class Groceries {
  static Stream<List<Grocery>> get listen => AppState.groceriesSubject.stream;

  static delete(int index) {
    final _oldState = groceriesDummy[index];
    groceriesDummy.removeAt(index);
    AppState.updateGroceriesSubject();

    Transaction(
      action: 'delete',
      dataType: 'grocery',
      oldState: _oldState.jsonify(),
      newState: 'nil',
    );
  }
}

class Posts {
  static Stream<List<Post>> get listen => AppState.postsSubject.stream;
  static test() {
    print("post test");
  }
}

class Products {}
