import 'package:usage/components/inventory/body.dart';
import 'package:usage/models/view.dart';
import 'package:usage/components/shared/icons.dart';
import 'package:usage/components/shared/fab.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/consumable.dart';

import 'package:flutter/material.dart';
import 'package:usage/app/appRoot.dart';

final inventoryView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: _section,
  fab: _fab,
  meta: _meta,
);

final _fab = Fab(
  icon: icons.add,
  fn: () {
    // Consumables.add(Consumable(
    //     productId: '0',
    //     name: 'cherries',
    //     quantity: 7,
    //     expiry: '7',
    //     description: 'they are cherries',
    //     imageUrl: 'cherries.png'));

    showDialog(
      context: AppRoot.context,
      builder: (context) {
        return AlertDialog(
          title: Text('hello there'),
        );
      }
    );    
  },
);

final _body = InventoryBody();

final _leadingAction = null;

final _section = sections.inventory;

final _meta = null;

// final _leading = Container(
//   color: Colors.pink,
//   width: 200,
// );
