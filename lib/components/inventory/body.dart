import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/consumable.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/app/appState.dart';

class InventoryBody extends StatelessWidget {
  const InventoryBody({
    Key key,
  }) : super(key: key);
  // @override
  @override
  Widget build(BuildContext context) {
    var _stream;
    Consumable consumable = new Consumable();
    return StreamBuilder(
      stream: AppState.consumablesSubject,
      initialData: consumablesDummy,
      builder: (BuildContext context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index < snapshot.data.length) {
              consumable = snapshot.data[index];
              return Dismissible(
                key: ObjectKey(consumable),
                background: Container(color: Colors.green),
                secondaryBackground: Container(color: Colors.red),
                onDismissed: (direction) {
                  if(direction == DismissDirection.endToStart) {
                    Consumables.consumed(index);
                  } else {
                    Consumables.wasted(index);
                  }
                },
                child: ListTile(
                  title: Text(consumable.name),
                  onLongPress: () {},
                  onTap: () {
                    Consumables.delete(index);
                  },
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
