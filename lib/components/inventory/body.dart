import 'dart:async';

import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/components/shared/inputField.dart';
import 'package:usage/models/consumable.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/grocery.dart';

//Stateful due to Futures
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
              return Column(
                children: <Widget>[_listItem(consumable, index), Divider()],
              );
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
                  Hero(
                    tag: consumable.id,
                    child: Image.network(consumable.imageUrl,
                        width: 100.0, height: 100.0),
                  ),
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
                    Material(
                      child: Row(
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

  Widget _listItem(Consumable consumable, int index) {
    String dateText = 'Days Left: ';
    int difference;
    Color dateColor;
    if (consumable.expiry != null) {
      DateTime expiry = DateTime.parse(consumable.expiry);
      Duration dur = DateTime.now().difference(expiry);
      String differenceInDays = (dur.inDays).toString();
      difference = int.parse(differenceInDays) * -1;
      if (difference < 4 && difference > -1) {
        dateColor = Colors.orange;
      } else if (difference > 4) {
        dateColor = Colors.green;
      } else {
        dateColor = Colors.red;
        dateText = "Days Expired: ";
        difference = difference * -1;
      }
    } else {
      dateText = '';
      difference = null;
    }
    if (consumable.imageUrl == null) {
      consumable.imageUrl = 'https://via.placeholder.com/150';
    }

    return Dismissible(
      key: new Key('dismissable'),
      background: Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[Text('USED')],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[Text('WASTED')],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          Consumables.consumed(index);
        } else {
          Consumables.wasted(index);
        }
      },
      child: ListTile(
        key: new Key('listTile'),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Hero(
            tag: consumable.id,
            child: Image.network(
              consumable.imageUrl, fit: BoxFit.fill,
              // height: 20.0,
              // width: 20.0,
            ),
          ),
          maxRadius: 15.0,
        ),
        title: Text(
          consumable.name,
          key: new Key('listTileTitle'),
        ),
        subtitle: Text(
          '$dateText $difference',
          style: TextStyle(color: dateColor),
        ),
        onLongPress: () {
          quickEditDialog(context, consumable, index);
        },
        onTap: () {
          _pushViewConsumableScreen(context, consumable, index);
        },
        trailing: CircleAvatar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          child: Text(
            consumable.quantity.toString().split('.')[0],
          ),
        ),
      ),
    );
  }
}
