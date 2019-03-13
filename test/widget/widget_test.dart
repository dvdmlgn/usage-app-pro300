import 'package:flutter_test/flutter_test.dart';
import 'package:usage/components/inventory/body.dart';
import 'package:usage/components/shopping/basket/body.dart';
import 'package:usage/components/shopping/list/body.dart';
import 'package:usage/components/social/socialFeed.dart';
import 'package:usage/components/social/socialSaved.dart';

void main() {
  testWidgets('Inventory Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(InventoryBody());
  });

  testWidgets('Shopping List Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(ShoppingListBody());
  });

  testWidgets('Shopping List Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(ShoppingBasketBody());
  });

  testWidgets('Shopping List Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(SocialFeed());
  });

  testWidgets('Shopping List Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(SavedPosts());
  });
}
