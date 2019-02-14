import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import './miscella.dart';
import '../app/dataStore.dart';
import './transactionLog.dart';
import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';

final String filename = 'cache.json';
String directory = '';
File file;
bool fileExists = false;

Future<String> readFile() async {
  _setupFile();

  return file.readAsString();
}

writeFile(String contents) async {
  _setupFile();

  file.writeAsString(contents);
}

_setupFile() async {
  getApplicationDocumentsDirectory()
    .then( (dir) =>  directory = dir.path);

  file = File('$directory/$filename');
  fileExists = await file.exists();

  if (!fileExists) { file.create(); }
}

backup() async {
  String _products      = '['; 
  String _consumables   = '[';
  String _groceries     = '[';
  String _tranactionLog = '[';


  for (var product in products) {
    _products += '${product.jsonify()},';
  }
  _products += ']';

  for (var consumable in consumables) {
    _consumables += '${consumable.jsonify()},';
  }
  _consumables += ']';

  for (var grocery in groceries) {
    _groceries += '${grocery.jsonify()},';
  }
  _groceries += ']';

  for (var transaction in transactionLog) {
    _tranactionLog += '${transaction.jsonify()},';
  }
  _tranactionLog += ']';


  _products      = encrypt(_products);
  _consumables   = encrypt(_consumables);
  _groceries     = encrypt(_groceries);
  _tranactionLog = encrypt(_tranactionLog);


  final data = {
    'products' : _products,
    'consumables' : _consumables,
    'groceries' : _groceries,
    'transactionLog' : _tranactionLog
  }
    .toString();

  writeFile(data);
}


read() async {
  String _products      = ''; 
  String _consumables   = '';
  String _groceries     = '';
  String _tranactionLog = '';

  var _productsList = <String>[];
  var _consumablesList = <String>[];
  var _groceriesList = <String>[];
  var _transactionsList = <String>[];

  final data = await readFile();
  final decodedData = jsonDecode(data);

  // assign encrypted string to appropriate place
  _products      = decodedData['products'];
  _consumables   = decodedData['consumables'];
  _groceries     = decodedData['groceries'];
  _tranactionLog = decodedData['transactionLog'];

  // decrypt each string into a string json list
  _products      = decrypt(_products);
  _consumables   = decrypt(_consumables);
  _groceries     = decrypt(_groceries);
  _tranactionLog = decrypt(_tranactionLog);

  // convert each json string to a list
  _productsList      = jsonDecode(_products);
  _consumablesList   = jsonDecode(_consumables);
  _groceriesList     = jsonDecode(_groceries);
  _transactionsList  = jsonDecode(_tranactionLog);

  for (var product in _productsList) {
    // products.add( Product.fromJson(product) );
  }
  

}