import 'package:usage/components/inventory/body.dart';
import 'package:usage/models/view.dart';
import 'package:usage/components/icons.dart';
import 'package:usage/components/fab.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/consumable.dart';

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
    Consumables.add(Consumable(
        productId: '0',
        name: 'cherries',
        quantity: 7,
        expiry: '7',
        description: 'they are cherries',
        imageUrl: 'cherries.png'));
  },
);

final _body = InventoryBody();

final _leadingAction = null;

final _section = sections.inventory;

final _meta = null;
