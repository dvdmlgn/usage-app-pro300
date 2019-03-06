import 'package:usage/components/inventory/body.dart';
import 'package:usage/models/view.dart';
import 'package:usage/components/icons.dart';
import 'package:usage/components/fab.dart';

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
