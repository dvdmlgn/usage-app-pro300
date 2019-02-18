import 'package:flutter/material.dart';

import '../app/dataStore.dart';
import '../app/logic.dart';
// import '../backend/transactionLog.dart';
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
  List<Consumable> _consumables = consumables;
  String reason;
  bool doFill = true;

  @override
  Widget build(BuildContext context) {
    if (doFill) {
      fillList();
      doFill = false;
    }

    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          addDialog(context);
        },
        backgroundColor: Colors.red,
        // mini: true,
        child: new Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _consumables.length,
        itemBuilder: (context, index) {
          final consumable = _consumables[index];

          return Dismissible(
            key: ObjectKey(consumable),
            secondaryBackground: Container(color: Colors.red),
            onDismissed: (direction) {
              //FYI DAVID!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              if (direction == DismissDirection.startToEnd) {
                Consumables.consumed(index);
              } else {
                Consumables.wasted(index);
              }
              //HERE LIES THE PROBLEM
              setState(() {
                // consumables.removeAt(index);
                // _consumables.remove(consumable);

                // _consumables.removeAt(index);
              }

                  // this.deactivate();
                  );
              // print('consumableList');
              // for (var item in consumables) {
              //   print(item.jsonify());
              // }
              // print('transaction log');
              // for (var item in transactionLog) {
              //   print(item.jsonify());
              // }
              // print(
              //     '-----------------------------------------------------------');

              // print('consumables');
              // for (var item in consumables) {
              //   print(item.name);
              // }

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
                viewDialog(context, consumable);
              },
              onLongPress: () {
                print("BEFORE");
                for (var item in consumables) {
                  print(item.jsonify());
                }
                // quickEditDialog(context, consumable, index).then(true);
                print("AFTER");
                for (var item in consumables) {
                  print(item.jsonify());
                }
                // setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}

Future<bool> viewDialog(BuildContext context, Consumable item) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: Colors.transparent),
          child: SimpleDialog(
            children: <Widget>[
              Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        item.name.toUpperCase(),
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('PRODUCT ID:'),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text(
                              item.productId,
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(children: <Widget>[
                        Expanded(child: Text('QUANTITY: '), flex: 1),
                        Expanded(
                            child: Text(item.quantity.toString()), flex: 1),
                      ]),
                    ),
                    Row(
                      children: <Widget>[
                        CloseButton(),
                        FlatButton.icon(
                          icon: Icon(Icons.edit),
                          label: Text('EDIT'),
                          onPressed: () {
                            editDialog(context, item);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

Future<bool> editDialog(BuildContext context, Consumable item) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: Colors.transparent),
          child: SimpleDialog(
            children: <Widget>[
              Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: item.name.toUpperCase(),
                        style: TextStyle(fontSize: 40.0, color: Colors.red),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('PRODUCT ID:'),
                            flex: 1,
                          ),
                          Expanded(
                            child: TextFormField(
                              initialValue: item.productId,
                              enabled: false,
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(children: <Widget>[
                        Expanded(child: Text('QUANTITY: '), flex: 1),
                        Expanded(
                            child: TextFormField(
                              initialValue: item.quantity.toString(),
                            ),
                            flex: 1),
                      ]),
                    ),
                    Row(
                      children: <Widget>[
                        BackButton(),
                        FlatButton.icon(
                          icon: Icon(Icons.save),
                          label: Text('SAVE'),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

Future<bool> addDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: Colors.transparent),
          child: SimpleDialog(
            children: <Widget>[
              Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[Text('ADD FORM HERE')],
                ),
              ),
            ],
          ),
        );
      });
}

Future<bool> quickEditDialog(BuildContext context, Consumable item, int index) {
  final myController = TextEditingController();
  myController.text = item.quantity.toString();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: Colors.transparent),
          child: SimpleDialog(
            children: <Widget>[
              Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Quantity: '),
                          flex: 1,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: myController,
                            // initialValue: item.quantity.toString(),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    FlatButton(
                      child: Text('Save'),
                      onPressed: () {
                        Consumables.quickEdit(
                            index, double.parse(myController.text));
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
