import 'dart:convert';
import '../models/consumable.dart';
import 'transactionLog.dart';
import '../app/dataStore.dart';

class JsonParse {
  static String fromConsumables() => jsonEncode(consumables);

  static List<Consumable> toConsumabes(String json) {
    var consumableList = <Consumable>[];

    var parsedMaps = jsonDecode(json);

    for (var item in parsedMaps) {
      consumableList.add(Consumable.fromJson(item));
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
