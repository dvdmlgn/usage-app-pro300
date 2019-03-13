import 'package:usage/app/appState.dart';
import 'package:usage/components/shopping/basket/body.dart';
import 'package:usage/models/view.dart';
import 'package:usage/views/switch.dart';

final shoppingBasketView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: _section,
  fab: _fab,
  meta: _meta,
);

final _fab = null;

final _body = ShoppingBasketBody();

final _leadingAction = LeadingActionSwitch(
  value: true,
  fn: (value) {
    print("new value: $value");
    AppState.setActiveView('shopping list');
  },
);

final _section = sections.shopping;

final _meta = null;
