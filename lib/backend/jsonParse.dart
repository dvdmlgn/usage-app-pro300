import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/consumable.dart';
// add more modles heres
import 'transactionLog.dart';
import '../app/dataStore.dart';

// ===================================================================
//  *note*
//  right now (19 feb 19) this file is only intended for use
//  in the local storage file, to help with backup things
// ===================================================================

class JsonParse {

  static String fromConsumables() => jsonEncode(consumables);

  static List<Consumable> toConsumabes(String json) {
    var consumableList = <Consumable>[];

    // debugPrint('before consumables decoded');
    var parsedMaps = jsonDecode(json);
    // debugPrint('after consumables decoded');

    for (var item in parsedMaps) {
      consumableList.add( Consumable.fromJson(item) );
    }
    
    return consumableList;
  }

  static String fromProducts() => jsonEncode(products);

  




  static String fromTransactionLog() {


    return 'hello';
  }

  static List<Transaction> toTransactionLog() {

    return null;
  }


}