import 'dart:async';

import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/components/shared/inputField.dart';
import 'package:usage/models/consumable.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/grocery.dart';

class InventoryBody extends StatefulWidget {
  const InventoryBody({
    Key key,
  }) : super(key: key);

  @override
  _InventoryBodyState createState() => _InventoryBodyState();
}

class _InventoryBodyState extends State<InventoryBody> {
  @override
  Widget build(BuildContext context) {
    Consumable consumable = new Consumable();
    return StreamBuilder(
      stream: Consumables.listen,
      initialData: consumablesDummy,
      builder: (BuildContext context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index < snapshot.data.length) {
              consumable = snapshot.data[index];
              return _listItem(consumable, index);
            }
          },
        );
      },
    );
  }

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
                          Navigator.pop(context);

                          Consumables.quickEdit(
                              index, double.parse(myController.text));
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
                              Grocery newGrocery = new Grocery(
                                  name: consumable.name,
                                  quantity: consumable.quantity);
                              Groceries.create(newGrocery);
                              groceriesDummy.add(newGrocery);
                              Navigator.pop(context);
// TODO: Check if its already on shopping list

                              //add grocery to shopping list
                              // for (var item in groceriesDummy) {
                              //   if (item.name == consumable.name) {
                              //     //alertdialog, already on list, are you sure?
                              //     areYouSure(newGrocery);
                              //     //yes: add new grocery
                              //     //no: pop dialog
                              //   } else {
                              //     //add to list
                              //     groceriesDummy.add(newGrocery);
                              //   }
                              // }

                              // Navigator.pop(context);
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

  Future<bool> areYouSure(Grocery newGrocery) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
              data: Theme.of(context)
                  .copyWith(dialogBackgroundColor: Colors.transparent),
              child: SimpleDialog(children: <Widget>[
                Card(
                    elevation: 4,
                    child: Row(children: <Widget>[
                      MaterialButton(
                          child: Text('Yes'),
                          color: Colors.green,
                          onPressed: () {
                            groceriesDummy.add(newGrocery);

                            Navigator.of(context).pop();
                            Navigator.pop(context);
                          }),
                      MaterialButton(
                          child: Text('No'),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pop(context);
                          }),
                    ])),
              ]));
        });
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
                      Consumable newConsumable =
                          new Consumable(name: newName, quantity: newQty);
                      Consumables.edit(index, newConsumable);

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

// //ADD CONSUMABLE SCREEN
//   void _pushAddConsumableScreen() {
//     final _formKey = GlobalKey<FormState>();
//     final nameCtrl = TextEditingController();
//     final qtyCtrl = TextEditingController();
//     double widgetWidth = (MediaQuery.of(context).size.width) * .8;
//     Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//       return new Scaffold(
//           appBar: new AppBar(title: new Text('Add a new consumable')),
//           body: Center(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: <Widget>[
//                   InputField.inputField(widgetWidth, nameCtrl, true,
//                       TextInputType.text, 'Name', ''),
//                   InputField.inputField(widgetWidth, qtyCtrl, true,
//                       TextInputType.number, 'Quantity', ''),
//                   MaterialButton(
//                     minWidth: widgetWidth,
//                     child: Text('ADD'),
//                     onPressed: () {
//                       if (_formKey.currentState.validate()) {
//                         _addConsumable(
//                             nameCtrl.text, double.parse(qtyCtrl.text));
//                         Navigator.pop(context); // Close the add todo screen

//                       }
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ));
//     }));
//   }

// //ADD CONSUMABLE
//   void _addConsumable(String name, double qty) {
//     // setState(() => Consumables.create(Consumable(name: name, quantity: qty)));
//   }

  Widget _listItem(Consumable consumable, int index) {
    return Dismissible(
      key: ObjectKey(consumable),
      background: Container(color: Colors.green),
      secondaryBackground: Container(color: Colors.red),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          Consumables.consumed(index);
        } else {
          Consumables.wasted(index);
        }
      },
      child: ListTile(
        title: Text(consumable.name),
        // TODO: QUICKEDIT
        onLongPress: () {
          quickEditDialog(context, consumable, index);
        },
        // TODO: HERO
        onTap: () {
          _pushViewConsumableScreen(context, consumable, index);
        },
        trailing: Text(
          consumable.quantity.toString().split('.')[0],
        ),
      ),
    );
  }
}
