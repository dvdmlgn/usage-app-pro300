import 'package:flutter/material.dart';

import '../app/dataStore.dart';
import '../app/logic.dart';
import '../backend/transactionLog.dart';
import '../models/consumable.dart';
// var i1 = new Consumable(productId: "1", name: 'Apple', quantity: 2);
// var i2 = new Consumable(productId: "2", name: 'Banana', quantity: 3);
// var i3 = new Consumable(productId: "3", name: 'Carrot', quantity: 5);
// var i4 = new Consumable(productId: "4", name: 'Date', quantity: 7);
// var i5 = new Consumable(productId: "5", name: 'Grapes', quantity: 11);
// var i6 = new Consumable(productId: "6", name: 'Lemon', quantity: 13);

// List<Consumable> consumableList = [];

class InventoryPage extends StatefulWidget {
  @override
  State createState() => new InventoryList();
}

class InventoryList extends State<InventoryPage> {
  String reason;

  @override
  Widget build(BuildContext ctxt) {
    fillList();
    // consumableList = consumables;
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {/* OPEN MODAL */},
        backgroundColor: Colors.red,
        mini: true,
        child: new Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: consumables.length,
        itemBuilder: (context, index) {
          final consumable = consumables[index];

          return Dismissible(
            key: Key(index.toString()),
            secondaryBackground: Container(color: Colors.red),
            onDismissed: (direction) {
              //FYI DAVID!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

              //HERE LIES THE PROBLEM
              setState(() {
                // consumables.removeAt(index);
                if (direction == DismissDirection.startToEnd) {
                  Consumables.consumed(index);
                } else {
                  Consumables.wasted(index);
                }
              });
              // print('consumableList');
              // for (var item in consumableList) {
              //   print(item.name);
              // }
              print(
                  '-----------------------------------------------------------');

              print('consumables');
              for (var item in consumables) {
                print(item.name);
              }

              // print("TRANSACTION LOG");
              // for (var item in transactionLog) {
              //   print(item.jsonify());
              // }

              // reason =
              //     direction == DismissDirection.startToEnd ? "used" : "wasted";

              // Scaffold.of(context).showSnackBar(
              //     SnackBar(content: Text(consumable.name + ' ' + reason)));
              // print(consumable.name + ' ' + reason);
            },
            background: Container(color: Colors.green),
            child: ListTile(
              title: Text(consumable.name),
              trailing: Text(consumable.quantity.toString()),
              onTap: () {
                // editDialog(context, item);
              },
              onLongPress: () {
                print(consumable.name + 's Quick Edit');
              },
            ),
          );
        },
      ),
    );
  }
}
