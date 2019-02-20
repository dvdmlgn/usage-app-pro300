import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import './miscella.dart';
import '../app/dataStore.dart';
import './transactionLog.dart';
import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import 'package:flutter/material.dart';
import 'jsonParse.dart';

// final String filename = 'cache.json';
// String directory = '';
// File file;
// bool fileExists = false;

// Future<String> readFile() async {
//   _setupFile();

//   return file.readAsString();
// }

// writeFile(String contents) async {
//   _setupFile();

//   file.writeAsString(contents);
// }

// _setupFile() async {
//   getApplicationDocumentsDirectory()
//     .then( (dir) =>  directory = dir.path);

//   file = File('$directory/$filename');
//   fileExists = await file.exists();

//   if (!fileExists) { file.create(); }
// }

// backup() async {
//   String _products      = '['; 
//   String _consumables   = '[';
//   String _groceries     = '[';
//   String _tranactionLog = '[';


//   for (var product in products) {
//     _products += '${product.jsonify()},';
//   }
//   _products += ']';

//   for (var consumable in consumables) {
//     _consumables += '${consumable.jsonify()},';
//   }
//   _consumables += ']';

//   for (var grocery in groceries) {
//     _groceries += '${grocery.jsonify()},';
//   }
//   _groceries += ']';

//   for (var transaction in transactionLog) {
//     _tranactionLog += '${transaction.jsonify()},';
//   }
//   _tranactionLog += ']';


//   _products      = encrypt(_products);
//   _consumables   = encrypt(_consumables);
//   _groceries     = encrypt(_groceries);
//   _tranactionLog = encrypt(_tranactionLog);


//   final data = {
//     'products' : _products,
//     'consumables' : _consumables,
//     'groceries' : _groceries,
//     'transactionLog' : _tranactionLog
//   }
//     .toString();

//   writeFile(data);
// }


// read() async {
//   String _products      = ''; 
//   String _consumables   = '';
//   String _groceries     = '';
//   String _tranactionLog = '';

//   var _productsList = <String>[];
//   var _consumablesList = <String>[];
//   var _groceriesList = <String>[];
//   var _transactionsList = <String>[];

//   final data = await readFile();
//   final decodedData = jsonDecode(data);

//   // assign encrypted string to appropriate place
//   _products      = decodedData['products'];
//   _consumables   = decodedData['consumables'];
//   _groceries     = decodedData['groceries'];
//   _tranactionLog = decodedData['transactionLog'];

//   // decrypt each string into a string json list
//   _products      = decrypt(_products);
//   _consumables   = decrypt(_consumables);
//   _groceries     = decrypt(_groceries);
//   _tranactionLog = decrypt(_tranactionLog);

//   // convert each json string to a list
//   _productsList      = jsonDecode(_products);
//   _consumablesList   = jsonDecode(_consumables);
//   _groceriesList     = jsonDecode(_groceries);
//   _transactionsList  = jsonDecode(_tranactionLog);

//   for (var product in _productsList) {
//     // products.add( Product.fromJson(product) );
//   }
  

// }

// performDeviceBackup() {

// }

// /*Map<String, String>*/ String jsonifyLists() {
//   var cache = Map<String, String>();

//   //debugPrint( jsonEncode(consumables) );

//   // var test = """
//   // [
//   //   {"id": "3234", "name": "test", "thiswon": "woo"},
//   //   {"id": "3234", "name": "test", "thiswon": "woo"},
//   //   {"id": "3234", "name": "test", "thiswon": "woo"}
//   // ]
//   // """;

//   // var thatone = jsonDecode(test);
//   // var thiswon = thatone[0];
//   // debugPrint(thiswon['id']);

//   // var testItem = consumables[0];

//   var itemJson = Consumable.listToJson(consumables);
//   debugPrint(itemJson);

//   // var deJsoned = Consumable.fromJson(itemJson);

//   var thiswon = jsonDecode(itemJson);

//   var thatone = <dynamic>[];

//   for(var item in thiswon) {
//     thatone.add(item);
//     // debugPrint(item);
//   }
//   // debugPrint(deJsoned.name);

//   // cache['comsumables'] = jsonEncode(consumables);

//   // var thatone = jsonEncode(consumables[0].jsonify());

//   //  debugPrint(thatone);

//   // var thiswon = jsonDecode(thatone);

//   // // debugPrint(cache['consumables']);

//   // debugPrint(thiswon);

//   // var yermin = Consumable.fromJson(thiswon);

//   // debugPrint( cache['consumables'] );

//   // debugPrint( json.decode(cache['consumables']) );

//   // cache['products'] = jsonEncode(products);

//   //return encrypt( jsonEncode(consumables) );
//   //return cache['consumables'];

//   return 'hello there,';
// }


class LocalCache {

  static Future<bool> backup() async {
    var _cache    = Map<String, String>();
    var _snapshot = Map<String, String>();

    _snapshot.addAll( await _takeSnapshot() );

    var timestamp = newTimestamp();

    // debugPrint('we got em');

    // debugPrint(_snapshot['products']);

    _cache[timestamp] = jsonEncode(_snapshot);

    // debugPrint('');
    // debugPrint('cache $timestamp');
    // debugPrint(_cache[timestamp]);

    var _encoded = jsonEncode(_cache);
    // debugPrint(_encoded);

    var _encrypted = encrypt( _encoded );
    // debugPrint(_encrypted); 

    var _decrypted = decrypt(_encrypted);
    //  debugPrint(_decrypted);

    Map<String, dynamic> decryptedCache = json.decode(_decrypted);
    // debugPrint(decryptedCache);
    // decryptedCache.forEach( (key, value) => debugPrint('$key') );

    var key = decryptedCache.keys.first;

    // debugPrint(key);

    Map<String, dynamic> decryptedSnapshot = json.decode(decryptedCache[key]);
    debugPrint(decryptedSnapshot.toString());

    decryptedSnapshot.forEach( (key, value) =>  debugPrint('$key') );

    var consums = decryptedSnapshot['consumables'];

    // for (var item in consums) {
    //   debugPrint(item.toString());
    // }
    

    // var myThing = (JSON.decode(stuff) as List).map((e) => new MyClass.fromJson(e)).toList();

    // var listKeys = decryptedSnapshot.keys.first;
    // debugPrint(listKeys);

    // Map<String, dynamic> decryptedConsumables = json.decode(decryptedSnapshot[listKeys]);
    // debugPrint(decryptedConsumables.toString());

    // var dc = json.decode(decryptd)



    return false;
  }
}


Future< Map<String, String> > _takeSnapshot() async {
  var _snapshot = Map<String, String>();

  _snapshot['consumables'] = JsonParse.fromConsumables();
   _snapshot['products'] = JsonParse.fromProducts();
  // _snapshot['groceries'] = JsonParse.fromGroceries();
  // put rest of data lsits here..
  // _snapshot['transactionLog'] = JsonParse.fromTransactionLog();

  // debugPrint('');
  // debugPrint('snapshot products');
  // debugPrint(_snapshot['products']);

    // debugPrint('');
    // debugPrint('snapshot consumables');

    // debugPrint( _snapshot['consumables'] );

    var encypted = encrypt(_snapshot['consumables']);
    // debugPrint(encypted);

    var decyrpted = decrypt(encypted);
    // debugPrint(decyrpted);

    // debugPrint('');
    // debugPrint('snapshot testCase');
    // _snapshot['testCase'] = decyrpted; 
    // debugPrint(_snapshot['testCase']);


  return _snapshot;
}