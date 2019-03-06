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

  }

  static consumed(int index) {

  }

  static wasted(int index) {

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