import 'package:flutter/material.dart';

import 'dataStore.dart';
import 'appState.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/product.dart';

class Consumables {
  static Stream< List<Consumable> > get Get => AppState.consumablesSubject.stream;

  static add(Consumable newItem) {
    consumables.add(newItem);
    // transaction log
  }

  static edit(int index, Consumable newData) {


    consumables[index] = newData;
  }

  static quickEdit(int index, Consumable newData) {

  }

  static delete(int index) {
    debugPrint('item at index $index was deleted');

    consumablesDummy.removeAt(index);
    AppState.consumablesSubject.sink.add(consumablesDummy);
  }

  static consumed(int index) {
    debugPrint('item at index $index was consumed');

    consumablesDummy.removeAt(index);
    AppState.consumablesSubject.sink.add(consumablesDummy);
  }

  static wasted(int index) {
    debugPrint('item at index $index was consumed');

    consumablesDummy.removeAt(index);
    AppState.consumablesSubject.sink.add(consumablesDummy);
  }

  static moveToShoppingList(int index) {

  }



}


class Groceries {

}


class Posts {

}


class Products {

}