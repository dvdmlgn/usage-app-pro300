import 'package:flutter/material.dart';
import 'package:usage/app/appState.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/components/shared/inputField.dart';
import 'package:usage/models/grocery.dart';

// TODO: DISPLAY ONLY ITEMS NOT IN BASKET
class ShoppingListBody extends StatelessWidget {
  const ShoppingListBody({
    Key key,
  }) : super(key: key);
  Text getQuantity(Grocery grocery) =>
      Text(grocery.quantity.toString().split('.')[0]);

  @override
  Widget build(BuildContext context) {
    Grocery grocery = Grocery();
    return StreamBuilder(
        stream: Groceries.listen,
        initialData: groceriesDummy,
        builder: (BuildContext context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              List<Grocery> shopList = new List<Grocery>();
              for (var g in snapshot.data) {
                if (g.inBasket == false) {
                  shopList.add(g);
                }
              }
              if (index < shopList.length) {
                grocery = shopList[index];
                return _listItem(grocery, index, context);
              }
            },
          );
        });
  }
}

Widget _listItem(Grocery grocery, int index, BuildContext context) {
  return Dismissible(
    key: ObjectKey(grocery),
    background: Container(color: Colors.green),
    secondaryBackground: Container(color: Colors.red),
    onDismissed: (direction) {
      if (direction == DismissDirection.startToEnd) {
        grocery.inBasket = true;
        AppState.updateGroceriesSubject();
        AppState.setActiveView('shopping basket');
      } else {
        Groceries.delete(index);
      }
    },
    child: ListTile(
      title: Text(grocery.name),
      // TODO: QUICK EDIT
      onLongPress: () {
        quickEditDialog(context, grocery, index);
      },
      onTap: () => _pushViewGroceryScreen(context, grocery, index),
      trailing: Text(grocery.quantity.toString().split('.')[0]),
    ),
  );
}

//QUICK EDIT POP UP
Future<bool> quickEditDialog(BuildContext context, Grocery grocery, int index) {
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

                        Navigator.pop(context);
                        Groceries.quickEdit(
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

//VIEW GROCERY SCREEN
void _pushViewGroceryScreen(BuildContext context, Grocery grocery, int index) {
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
                          // deleteGroceryDialog(index, grocery);
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

//EDIT GROCERY SCREEN
void _pushEditGroceryScreen(BuildContext context, Grocery grocery, int index) {
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
                InputField.inputField(
                    200.0, qtyCtrl, true, TextInputType.number, 'Quantity', ''),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    newName = nameCtrl.text;
                    newQty = double.parse(qtyCtrl.text);
                    grocery.name = newName;
                    grocery.quantity = newQty;
                    // setState(() {});
                    Grocery newGrocery =
                        Grocery(name: newName, quantity: newQty);
                    Groceries.edit(index, newGrocery);
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