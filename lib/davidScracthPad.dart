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


class StorageTest extends StatelessWidget {
  var _productsString = '';
  var _transactionsString = '';



  @override
  Widget build(BuildContext context) {

    fillList();



    return Center(
      child: Column(
        children: [
          Text('products to string:'),
          Text(_productsString),
          Text('transactions to string:'),
          Text(_transactionsString),
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