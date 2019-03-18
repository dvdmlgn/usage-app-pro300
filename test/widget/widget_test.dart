import 'package:flutter_test/flutter_test.dart';
import 'package:usage/app/appRoot.dart';
import 'package:usage/components/inventory/body.dart';
import 'package:usage/components/shopping/basket/body.dart';
import 'package:usage/components/shopping/list/body.dart';
import 'package:usage/components/social/socialFeed.dart';
import 'package:usage/components/social/socialSaved.dart';
import 'package:usage/main.dart';

void main() {
  testWidgets('Main Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });
  //_State
  testWidgets('AppRoot Test', (WidgetTester tester) async {
    await tester.pumpWidget(AppRoot());
  });
  testWidgets('Inventory Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(InventoryBody());
  });

  testWidgets('Shopping List Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(ShoppingListBody());
  });

  testWidgets('Shopping Basket Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(ShoppingBasketBody());
  });

  testWidgets('Social Feed Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(SocialFeed());
  });

  testWidgets('Social Saved Body Test', (WidgetTester tester) async {
    await tester.pumpWidget(SavedPosts());
  });
}
