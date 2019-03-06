import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';

class ShoppingBasketBody extends StatelessWidget {
  const ShoppingBasketBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numOfGroceries = 0;

    for (var g in groceries) {
      if (g.inBasket) {
        numOfGroceries++;
      }
    }
    var _stream;
    return StreamBuilder(
      stream: _stream,
      builder: (BuildContext context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index < numOfGroceries) {
              if (groceries[index].inBasket) {
                return Dismissible(
                  key: ObjectKey(groceries[index]),
                  background: Container(color: Colors.green),
                  secondaryBackground: Container(color: Colors.red),
                  onDismissed: (direction) {},
                  child: ListTile(
                    title: Text(groceries[index].name),
                    onTap: () {},
                    onLongPress: () {},
                    trailing: Text(
                        groceries[index].quantity.toString().split('.')[0]),
                  ),
                );
              }
            }
          },
        );
      },
    );
  }
}
