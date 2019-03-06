import 'package:usage/ui/components/fab.dart';
import 'package:usage/ui/components/icons.dart';
import 'package:usage/ui/components/switch.dart';
import 'package:usage/ui/views/shopping/list/shoppingListBody.dart';
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
  type: 'Grocery',
  fn: () {},
);

final _body = ShoppingListBody();

final _leadingAction = LeadingActionSwitch(
  value: false,
);

final _section = sections.shopping;

final _meta = null;
