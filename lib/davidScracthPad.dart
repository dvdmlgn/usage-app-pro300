import 'package:flutter/material.dart';
import 'backend/miscella.dart';
import 'backend/transactionLog.dart';
import 'models/consumable.dart';
import 'app/logic.dart';
import 'app/dataStore.dart';
import './inventory/inventory_page.dart';
import './inventory/gallery.dart';
import './backend/auth.dart';
import 'backend/localStorage.dart';
import 'dart:convert';
import 'backend/jsonParse.dart';


class StorageTest extends StatelessWidget {
  var _consumablesString = '';
  var _transactionsString = '';



  @override
  Widget build(BuildContext context) {

    fillList();

    // _consumablesString = jsonifyLists();

    _consumablesString = consumables[0].stringify();
    var parsed = jsonDecode(_consumablesString);

    Consumable thiswon = Consumable.fromJson(parsed);
    // debugPrint( thiswon.stringify() );

    var encodedJson = JsonParse.fromConsumables();
    var decodedJson = JsonParse.toConsumabes(encodedJson);

    // for (var item in decodedJson) {
    //   debugPrint( item.stringify() );
    // }

    var didBackup = LocalCache.backup();


    return Center(
      child: Column(
        children: [
          // Text( consumables[0].jsonify() ),
          // Text( _consumablesString ),
          // Text( parsed['name'] ),
          // Text( thiswon.name ),
          Text( encodedJson),
          Text( decodedJson[0].name ),
          Text( decodedJson[2].quantity.toString() ),
        ],
      ),
    );
  }
}


class DavidScratchPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("david scratch pad"),
      ),

      body: StorageTest(),
    );
  }
}