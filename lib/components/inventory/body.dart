import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/consumable.dart';

class InventoryBody extends StatelessWidget {
  const InventoryBody({
    Key key,
  }) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    var _stream;
    Consumable consumable = new Consumable();
    return StreamBuilder(
      stream: _stream,
      builder: (BuildContext context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index < consumablesDummy.length) {
              consumable = consumablesDummy[index];
              return Dismissible(
                key: ObjectKey(consumable),
                background: Container(color: Colors.green),
                secondaryBackground: Container(color: Colors.red),
                onDismissed: (direction) {},
                child: ListTile(
                  title: Text(consumable.name),
                  onLongPress: () {},
                  onTap: () {},
                  trailing: Text(consumable.quantity.toString().split('.')[0]),
                ),
              );
            }
          },
        );
      },
    );
  }
}
