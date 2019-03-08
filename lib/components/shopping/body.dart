import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/grocery.dart';

class ShoppingListBody extends StatelessWidget {
  const ShoppingListBody({
    Key key,
  }) : super(key: key);
  Text getQuantity(Grocery grocery) =>
      Text(grocery.quantity.toString().split('.')[0]);

  @override
  Widget build(BuildContext context) {
    Grocery grocery = new Grocery();
    return StreamBuilder(
        stream: Groceries.listen,
        initialData: groceriesDummy,
        builder: (BuildContext context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index < snapshot.data.length) {
                grocery = snapshot.data[index];
                return _listItem(grocery, index);
              }
            },
          );
        });
  }
}

Widget _listItem(Grocery grocery, int index) {
  return Dismissible(
    key: ObjectKey(grocery),
    background: Container(color: Colors.green),
    secondaryBackground: Container(color: Colors.red),
    onDismissed: (direction) {
      if (direction == DismissDirection.startToEnd) {
        // TODO: MOVE GROCERY TO BASKET
      } else {
        Groceries.delete(index);
      }
    },
    child: ListTile(
      title: Text(grocery.name),
      // TODO: QUICK EDIT
      onLongPress: () {},
      // TODO: HERO
      onTap: () => Groceries.delete(index),
      trailing: Text(grocery.quantity.toString().split('.')[0]),
    ),
  );
}
