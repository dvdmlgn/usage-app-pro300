import '../models/view.dart';

import '../views/inventory.dart';
import '../views/shoppingBasket.dart';
import '../views/shoppingList.dart';
import '../views/socialFeed.dart';
import '../views/socialSaved.dart';

// final views = Map<String, View>();

// views['inventory'] = InventoryView;

final views = {
  'inventory': inventoryView,
  'shopping list': ShoppingListView,
  'shopping basket': ShoppingBasketView,
  'social feed': SocialFeedView,
  'social saved': socialSavedView,
};

// newView(View view) {
//   views['thiswon'] = view;
// }
