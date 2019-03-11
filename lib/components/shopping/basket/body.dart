import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/grocery.dart';

// TODO: DISPLAY ONLY ITEMS IN BASKET
class ShoppingBasketBody extends StatelessWidget {
  const ShoppingBasketBody({
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
              List<Grocery> shopBasket = new List<Grocery>();
              for (var g in snapshot.data) {
                if (g.inBasket == true) {
                  shopBasket.add(g);
                }
              }
              if (index < shopBasket.length) {
                grocery = shopBasket[index];
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
