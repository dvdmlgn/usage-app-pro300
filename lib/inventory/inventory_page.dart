import 'package:flutter/material.dart';

import '../app/dataStore.dart';
// import '../app/logic.dart';
// import '../backend/transactionLog.dart';
import '../models/consumable.dart';

class InventoryPage extends StatefulWidget {
  @override
  State createState() => new InventoryList();
}

class InventoryList extends State<InventoryPage> {
  String reason;

  @override
  Widget build(BuildContext context) {
    fillList();

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
            onDismissed: (direction) {},
            background: Container(color: Colors.green),
            child: ListTile(
              title: Text(consumable.name),
              trailing: Text(consumable.quantity.toString()),
              onTap: () {
                viewDialog(context, consumable);
              },
              onLongPress: () {
                // quickEditDialog(context);
                // print(consumable.name + 's Quick Edit');
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
