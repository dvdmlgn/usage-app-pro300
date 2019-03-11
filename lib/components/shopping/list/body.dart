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
        // TODO: MOVE GROCERY TO BASKET
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
      onLongPress: () {},
      // TODO: HERO
      onTap: () => _pushViewGroceryScreen(context, grocery, index),
      trailing: Text(grocery.quantity.toString().split('.')[0]),
    ),
  );
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
                          // _pushEditGroceryScreen(context, grocery, index);
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
