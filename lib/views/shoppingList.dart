import 'package:usage/app/appState.dart';
import 'package:usage/components/shared/icons.dart';

import 'package:usage/components/shared/fab.dart';
import 'package:usage/components/shopping/list/body.dart';
import 'package:usage/models/view.dart';
import 'package:usage/views/switch.dart';

final shoppingListView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: _section,
  fab: _fab,
  meta: _meta,
);

final _fab = Fab(
  icon: icons.add,
  fn: () {},
);

final _body = ShoppingListBody();

final _leadingAction = LeadingActionSwitch(
  value: false,
  fn: (value) {
    print("new value: $value");
    AppState.setActiveView('shopping basket');
  },
);

final _section = sections.shopping;

final _meta = null;
