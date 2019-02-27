import 'package:flutter/material.dart';
import 'package:usage/models/grocery.dart';
import '../app/dataStore.dart';
import '../app/logic.dart';
import '../models/consumable.dart';
import 'package:usage/widgets/fab.dart';
import 'package:usage/widgets/inputField.dart';

class Inventory extends StatefulWidget {
  @override
  createState() => new InventoryState();
}

class InventoryState extends State<Inventory> {
  bool doFill = true;
  List<Consumable> _consumables = consumables;
  bool leadingValue = false;
  var selectedLeading;
  var selectedTitle;

  @override
  // BUILD THE INVENTORY SCAFFOLD
  Widget build(BuildContext context) {
    final TextEditingController _filter = new TextEditingController();

    _addDummyData();
    if (leadingValue) {
      selectedTitle = TextField(
        controller: _filter,
        decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
      );
      selectedLeading = IconButton(
          icon: Icon(Icons.close), onPressed: _handleIconBtnPresssed);
    } else {
      selectedTitle = Text("ShoppingList");
      selectedLeading = IconButton(
          icon: Icon(Icons.search), onPressed: _handleIconBtnPresssed);
    }
    return Scaffold(
      body: _buildInventoryList(),
      appBar: AppBar(
        title: selectedTitle,
        leading: IconButton(
          icon: selectedLeading,
          onPressed: () {
            leadingValue = !leadingValue;
          },
        ),
      ),
      floatingActionButton:
          Fabs.addListItemFab("Consumable", _pushAddConsumableScreen),
    );
  }

  //BUILD THE LIST
  Widget _buildInventoryList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _consumables.length) {
          return _buildConsumable(_consumables[index], index);
        }
      },
    );
  }

  //BUILD THE DISMISSABLE
  Widget _buildConsumable(Consumable consumable, int index) {
    return Dismissible(
      key: ObjectKey(consumable),
      child: _inventoryListConsuable(consumable, index),
      background: Container(color: Colors.green),
      secondaryBackground: Container(color: Colors.red),
      onDismissed: (direction) {
        _handleConsuableDismissed(direction, index, consumable);
      },
    );
  }

  //BUILD INVENTORY LIST ITEM
  Widget _inventoryListConsuable(Consumable consumable, int index) {
    return ListTile(
        title: Text(consumable.name),
        trailing: Text(consumable.quantity.toString().split('.')[0]),
        onTap: () => _pushViewConsumableScreen(context, consumable, index),
        onLongPress: () {
          quickEditDialog(context, consumable, index);
        });
  }

  //QUICK EDIT POP UP
  Future<bool> quickEditDialog(
      BuildContext context, Consumable consumable, int index) {
    final myController = TextEditingController();
    myController.text = consumable.quantity.toString();

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
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                      FlatButton(
                        child: Text('Save'),
                        onPressed: () {
                          setState(() => Consumables.quickEdit(
                              index, double.parse(myController.text)));
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

  //VIEL CONSUMABLE SCREEN
  void _pushViewConsumableScreen(
      BuildContext context, Consumable consumable, int index) {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    nameCtrl.text = consumable.name;
    qtyCtrl.text = consumable.quantity.toString();
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('View consumable')),
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputField.inputField(
                      200.0, nameCtrl, false, TextInputType.text, 'Name', ''),
                  InputField.inputField(200.0, qtyCtrl, false,
                      TextInputType.number, 'Quantity', ''),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _pushEditConsumableScreen(
                                context, consumable, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteConsumableDialog(index);
                            // Consumables.delete(index);
                            // Navigator.pop(context);
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.list),
                            onPressed: () {
                              //create a grocery = consumable
                              //add grocery to shopping list
                              for (var item in groceries) {
                                if (item.name == consumable.name) {
                                  //alertdialog, already on list, are you sure?
                                  //yes: add new grocery
                                  //no: pop dialog
                                } else {
                                  //add to list
                                }
                              }
                              groceries.add(
                                  Grocery(name: consumable.name, quantity: 0));

                              Navigator.pop(context);

                              for (var item in groceries) {
                                print(item.name);
                              }
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    }));
  }

  Future<bool> deleteConsumableDialog(int index) {
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
                  child: Column(children: <Widget>[
                    Text("What Happened?"),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 4.0),
                          child: MaterialButton(
                            child: Text('WASTED'),
                            color: Colors.red,
                            onPressed: () {
                              Consumables.wasted(index);
                              Navigator.of(context).pop();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.0),
                          child: MaterialButton(
                            child: Text('USED'),
                            color: Colors.green,
                            onPressed: () {
                              Consumables.consumed(index);
                              Navigator.of(context).pop();
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    MaterialButton(
                      child: Text('JUST DELETE IT!'),
                      color: Colors.blue,
                      onPressed: () {
                        Consumables.delete(index);
                        Navigator.of(context).pop();
                        Navigator.pop(context);
                      },
                    ),
                  ]),
                ),
              ],
            ),
          );
        });
  }

  //EDIT CONSUMABLE SCREEN
  void _pushEditConsumableScreen(
      BuildContext context, Consumable consumable, int index) {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    nameCtrl.text = consumable.name;
    qtyCtrl.text = consumable.quantity.toString();
    String newName;
    double newQty;
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Edit consumable')),
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputField.inputField(
                      200.0, nameCtrl, true, TextInputType.text, 'Name', ''),
                  InputField.inputField(200.0, qtyCtrl, true,
                      TextInputType.number, 'Quantity', ''),
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () {
                      newName = nameCtrl.text;
                      newQty = double.parse(qtyCtrl.text);
                      setState(() =>
                          Consumables.edit(index, consumable, newName, newQty));
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ));
    }));
  }

//ADD CONSUMABLE SCREEN
  void _pushAddConsumableScreen() {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    double widgetWidth = (MediaQuery.of(context).size.width) * .8;
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Add a new consumable')),
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputField.inputField(widgetWidth, nameCtrl, true,
                      TextInputType.text, 'Name', ''),
                  InputField.inputField(widgetWidth, qtyCtrl, true,
                      TextInputType.number, 'Quantity', ''),
                  MaterialButton(
                    minWidth: widgetWidth,
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
          ));
    }));
  }

//ADD CONSUMABLE
  void _addConsumable(String name, double qty) {
    setState(() => Consumables.create(Consumable(name: name, quantity: qty)));
  }

//REMOVE ITEM ON SWIPE
  void _handleConsuableDismissed(
      DismissDirection direction, int index, Consumable consumable) {
    if (direction == DismissDirection.startToEnd) {
      Consumables.consumed(index);
    } else {
      Consumables.wasted(index);
    }
  }

//POPULATE INVENTORY WITH DUMMY DATA
  void _addDummyData() {
    if (doFill) {
      fillList();
      doFill = false;
    }
  }

  void _handleIconBtnPresssed() {
    setState(() {
      leadingValue = !leadingValue;
    });
  }
}
