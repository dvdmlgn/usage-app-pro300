import 'package:flutter/material.dart';
import '../app/dataStore.dart';
import '../app/logic.dart';
import '../models/grocery.dart';
import '../models/consumable.dart';
import '../models/temp.dart';
import 'package:usage/widgets/fab.dart';
import 'package:usage/widgets/inputField.dart';

class Shopping extends StatefulWidget {
  @override
  createState() => new ShoppingState();
}

class ShoppingState extends State<Shopping> {
  bool doFill = true;
  List<Grocery> _allGroceries = groceries; //ALL GROCERIES
  List<Grocery> _shoppingList = []; //GROCESIES ON SHOPPING LIST
  List<Grocery> _basket = []; //GROCERIES IN BASKET
  TempGrocery tempGrocery = TempGrocery(
      grocery: Grocery(
        name: '',
        quantity: null,
      ),
      index: 0);
  bool switchValue = false;
  var selectedScreen;
  String title;

  @override
  // BUILD THE SHOPPING LIST SCAFFOLD
  Widget build(BuildContext context) {
    _addDummyData(); //this fills the groceries lsit with all groceries, including those set to inBasket
    //SORT INITIAL DATA
    for (var g in _allGroceries) {
      if (g.inBasket == false) {
        if (!_shoppingList.contains(g)) {
          _shoppingList.add(g);
        }
      } else {
        if (!_basket.contains(g)) {
          _basket.add(g);
        }
      }
    }

    print(_allGroceries.length);
    print(_shoppingList.length);
    print(_basket.length);

    if (switchValue == false) {
      //INVENTORY SCREEN
      title = "Shopping List";
      selectedScreen = _buildShoppingList();
    } else {
      //BASKET SCREEN
      title = "Basket";
      selectedScreen = _buildBasket();
    }

    return Scaffold(
      body: selectedScreen,
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          Switch.adaptive(
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              }),
        ],
      ),
      floatingActionButton:
          Fabs.addListItemFab("Grocery", _pushAddConsumableScreen),
    );
  }

  //BUILD THE LIST
  Widget _buildShoppingList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _shoppingList.length) {
          return _buildConsumable(_shoppingList[index], index);
        }
      },
    );
  }

  Widget _buildBasket() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _basket.length) {
          return _buildConsumable(_basket[index], index);
        }
      },
    );
  }

  //BUILD THE DISMISSABLE
  Widget _buildConsumable(Grocery grocery, int index) {
    //build dismissable dependent on wether its in shopping list or basket
    return Dismissible(
      key: ObjectKey(grocery),
      child: _shoppingListGrocery(grocery, index),
      background: Container(color: Colors.green),
      secondaryBackground: Container(color: Colors.red),
      onDismissed: (direction) {
        if (grocery.inBasket == false) {
          _handleShoppingListDismissed(direction, index, grocery);
        } else {
          _handleBasketDismissed(direction, index, grocery);
        }
        setState(() {});
      },
    );
  }

  //BUILD SHOPPING LIST LIST ITEM
  Widget _shoppingListGrocery(Grocery grocery, int index) {
    return ListTile(
        title: Text(grocery.name),
        trailing: Text(grocery.quantity.toString().split('.')[0]),
        onTap: () => _pushViewGroceryScreen(context, grocery, index),
        onLongPress: () {
          quickEditDialog(context, grocery, index);
        });
  }

  //QUICK EDIT POP UP
  Future<bool> quickEditDialog(
      BuildContext context, Grocery grocery, int index) {
    final myController = TextEditingController();
    myController.text = grocery.quantity.toString();

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
                          grocery.quantity = double.parse(myController.text);
                          setState(() {});
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
  void _pushViewGroceryScreen(
      BuildContext context, Grocery grocery, int index) {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    nameCtrl.text = grocery.name;
    qtyCtrl.text = grocery.quantity.toString();
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('View grocery')),
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
                            _pushEditGroceryScreen(context, grocery, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteConsumableDialog(index, grocery);
                            // Groceries.delete(index);
                            // Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    }));
  }

  Future<bool> deleteConsumableDialog(int index, Grocery grocery) {
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
                    MaterialButton(
                      child: Text('JUST DELETE IT!'),
                      color: Colors.blue,
                      onPressed: () {
                        groceries.remove(grocery);
                        if (_shoppingList.contains(grocery)) {
                          _shoppingList.remove(grocery);
                        }
                        if (_basket.contains(grocery)) {
                          _basket.remove(grocery);
                        }
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
  void _pushEditGroceryScreen(
      BuildContext context, Grocery grocery, int index) {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    nameCtrl.text = grocery.name;
    qtyCtrl.text = grocery.quantity.toString();
    String newName;
    double newQty;
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Edit grocery')),
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
                      grocery.name = newName;
                      grocery.quantity = newQty;
                      setState(() {});
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
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        return new Scaffold(
          appBar: new AppBar(title: new Text('Add a new grocery')),
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputField.inputField(widgetWidth, nameCtrl, true,
                      TextInputType.text, 'Name', ''),
                  InputField.inputField(widgetWidth, qtyCtrl, true,
                      TextInputType.number, 'Name', ''),
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
          ),
        );
      }),
    );
  }

//ADD CONSUMABLE
  void _addConsumable(String name, double qty) {
    setState(() => Groceries.create(Grocery(name: name, quantity: qty)));
  }

//REMOVE SHOPPING LIST ITEM ON SWIPE
  void _handleShoppingListDismissed(
      DismissDirection direction, int index, Grocery grocery) {
    // final snackBar =
    //     SnackBar(content: Text("Undo Delete: " + tempGrocery.grocery.name));

    if (direction == DismissDirection.startToEnd) {
      //SWIPE RIGHT => MOVE ITEM TO BASKET
      grocery.inBasket = true; //SET IN BASKET TO TRUE
      _basket.add(grocery); //ADD GROCERY TO BASKET LIST
      _shoppingList.removeAt(index); //REMOVE GROCERY FROM SHOPPINGLIST LIST
      //UPDATE TRANSACTION LOG
    } else {
      //SWIPE LEFT => DELETE THE ITEM
      tempGrocery = TempGrocery(
          grocery: grocery,
          index: index); //CREATE TEMP GROCERY FOR UNDO LAST DELETE
      _shoppingList.removeAt(index); //REMOVE GROCERY FROM SHOPPINGLIST LIST
      Groceries.delete(index); //DELETE GROCERY FROM ALL GROCERIES
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Undo Delete of " + tempGrocery.grocery.name),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              //ADD TEMP GROCERY TO ALL GROCERIES
              groceries.insert(index, tempGrocery.grocery);
              //ADD TEMP GROCERY TO SHOPPING LIST
              _shoppingList.insert(index, tempGrocery.grocery);
            },
          ),
        ),
      ); //DISPLAY SNACKBAR
    }
  }

  //REMOVE BASKET ITEM ON SWIPE
  void _handleBasketDismissed(
      DismissDirection direction, int index, Grocery grocery) {
    if (direction == DismissDirection.startToEnd) {
      //SWIPE RIGHT => MOVE ITEM TO inventory
      Consumables.create(Consumable(
          name: grocery.name,
          quantity: grocery.quantity,
          expiry: 'DATE',
          description: 'DESC',
          imageUrl:
              'null')); //CREATE A CONSUMABLE FROM GROCERY AND ADD TO INVENTORY LIST
      _basket.removeAt(index); //REMOVE GROCERY FROM BASKET
      Groceries.delete(index); ////DELETE GROCERY FROM ALL GROCERIES
    } else {
      //SWIPE LEFT => MOVE ITEM TO SHOPPING LIST
      grocery.inBasket = false; //SET IN BASKET TO FALSE
      _shoppingList.add(grocery); //ADD GROCERY TO SHOPPINGLIST LIST
      _basket.removeAt(index); //REMOVE GROCERY FROM BASKET
    }
  }

//POPULATE SHOPPING LIST AND BASKET WITH DUMMY DATA
  void _addDummyData() {
    if (doFill) {
      fillSList();
      doFill = false;
    }
  }
}
