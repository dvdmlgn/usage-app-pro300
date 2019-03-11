import 'dart:async';

import 'package:flutter/material.dart';
import 'package:usage/backend/transactionLog.dart';
import 'dataStore.dart';
import 'appState.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
// import '../models/product.dart';

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
    // final _consumable = consumables[index];
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

  static create(Grocery item) {
    groceries.add(item);

    Transaction(
        action: 'create',
        dataType: 'grocery',
        oldState: 'nil',
        newState: item.jsonify());
  }

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

  static edit(int index, Grocery item) {
    final oldState = groceries[index];
    groceries[index] = item;
    AppState.updateGroceriesSubject();

    Transaction(
      action: 'edit',
      dataType: 'grocery',
      oldState: oldState.jsonify(),
      newState: item.jsonify(),
    );
  }

  static addToBasket(int index) {
    groceries[index].inBasket = true;
    AppState.updateGroceriesSubject();
  }

  static removeFromBasket(int index) {
    groceries[index].inBasket = false;
  }

  static addToInventory(int index) {
    final _grocery = groceries[index];
    // convert grocery to consumable
    // Consumables.add(  );
    AppState.updateGroceriesSubject();
    AppState.updateConsumablesSubject();

    Transaction(
      action: 'basket to inventory',
      dataType: 'consumable',
      oldState: _grocery.jsonify(),
      // newState: 
    );
  }


}

class Posts {
  static Stream<List<Post>> get listen => AppState.postsSubject.stream;

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
      newState: 'nil'
    );
  }


  static addToSaved(int index) {
    savedPosts.add( posts[index] );
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

class Products {}
