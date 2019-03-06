import 'package:flutter/material.dart';
import 'package:usage/ui/views/Inventory/inventoryView.dart';
// import 'package:usage/ui/views/inventoryBody.dart';
import 'backend/miscella.dart';
import 'backend/transactionLog.dart';
import 'models/consumable.dart';
import 'app/logic.dart';
import 'app/dataStore.dart';
import './inventory/inventory_page.dart';
import './inventory/inventory.dart';
import 'package:usage/shoppingList/shopping.dart';

import './backend/auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String plainText =
      'why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,..';
  String encryptedText = '';
  String decryptedText = '';

  String conListString = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Biometric.init();

    for (var item in transactionLog) {
      debugPrint("transaction:");
      debugPrint(item.jsonify());
    }

    debugPrint(transactionLog.length.toString());

    conListString += "[";

    for (var item in consumables) {
      debugPrint("consumable");
      debugPrint(item.jsonify());
    }

    for (var item in transactionLog) {
      debugPrint("transaction:");
      debugPrint(item.jsonify());
    }

    debugPrint(transactionLog.length.toString());

    conListString += ']';

    encryptedText = encrypt(conListString);
    decryptedText = decrypt(encryptedText);

    return Scaffold(body: Inventory());
  }
}

final biometricTest = Center(
  child: RaisedButton(
    onPressed: () => Biometric.authenticate(),
    child: Text('test biometrics'),
  ),
);
