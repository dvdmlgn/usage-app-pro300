import 'package:usage/ui/components/fab.dart';
import 'package:usage/ui/components/icons.dart';
import 'package:usage/ui/views/Inventory/InventoryBody.dart';
import 'package:usage/ui/views/view.dart';

final inventoryView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: _section,
  fab: _fab,
  meta: _meta,
);

final _fab = Fab(
  icon: icons.add,
  type: 'Consumable',
  fn: () {},
);

final _body = InventoryBody();

final _leadingAction = null;

final _section = sections.inventory;

final _meta = null;
