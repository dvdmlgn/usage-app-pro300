// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';
import '../app/dataStore.dart';
import '../app/logic.dart';
// import '../backend/transactionLog.dart';
import '../models/consumable.dart';
// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".

// Every component in Flutter is a widget, even the whole app itself
class Inventory extends StatefulWidget {
  @override
  createState() => new InventoryState();
}

class InventoryState extends State<Inventory> {
  bool doFill = true;

  List<Consumable> _consumables = consumables;

  void _addConsumable(String name, double qty) {
    // Only add the task if the user actually entered something
    // if (task.length > 0) {
    // Putting our code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    setState(() => _consumables.add(Consumable(name: name, quantity: qty)));
    // }
  }

  void _removeConsumable(int index) {
    setState(() => _consumables.removeAt(index));
  }

  void _promptRemoveConsumable(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${_consumables[index]}" as done?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    // The alert is actually part of the navigation stack, so to close it, we
                    // need to pop it.
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeConsumable(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  // Build the whole list of todo items
  Widget _buildInventoryList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if (index < _consumables.length) {
          return _buildConsumable(_consumables[index], index);
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildConsumable(Consumable consumable, int index) {
    return Dismissible(
      child: new ListTile(
          title: new Text(consumable.name),
          trailing: new Text(consumable.quantity.toString().split('.')[0]),
          onTap: () => _promptRemoveConsumable(index)),
      key: ObjectKey(consumable),
      secondaryBackground: Container(color: Colors.red),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          Consumables.consumed(index);
          print(consumable.name + ' USED!!!!!');
        } else {
          Consumables.wasted(index);
          print(consumable.name + ' WASTED!!!!!');
        }
      },
      background: Container(color: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (doFill) {
      fillList();
      doFill = false;
    }
    return new Scaffold(
      body: _buildInventoryList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddConsumableScreen,
          tooltip: 'Add Consumable',
          child: new Icon(Icons.add)),
    );
  }

  void _pushAddConsumableScreen() {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    // Push this page onto the stack
    Navigator.of(context).push(
        // MaterialPageRoute will automatically animate the screen entry, as well as adding
        // a back button to close it
        new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Add a new consumable')),
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: nameCtrl,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                    ),
                    margin: EdgeInsets.all(8.0),
                  ),
                  Container(
                    width: 200.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      controller: qtyCtrl,
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                    ),
                    margin: EdgeInsets.all(8.0),
                  ),
                  MaterialButton(
                    minWidth: 200.0,
                    child: Text('ADD'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _addConsumable(
                            nameCtrl.text, double.parse(qtyCtrl.text));
                        Navigator.pop(context); // Close the add todo screen

                      }
                    },
                  )
                ],
              ),
            ),

            // new TextField(
            //   autofocus: true,
            //   onSubmitted: (name) {
            //     _addConsumable(name);
            //     Navigator.pop(context); // Close the add todo screen
            //   },
            //   decoration: new InputDecoration(
            //       hintText: 'Enter name',
            //       contentPadding: const EdgeInsets.all(16.0)),
            // ),
            // new TextField(
            //   autofocus: true,
            //   onSubmitted: (qty) {
            //     _addConsumable(qty);
            //     Navigator.pop(context); // Close the add todo screen
            //   },
            //   decoration: new InputDecoration(
            //       hintText: 'Enter quantity',
            //       contentPadding: const EdgeInsets.all(16.0)),
            // ),
          ));
    }));
  }
}