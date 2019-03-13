import 'package:flutter_test/flutter_test.dart';
import 'package:usage/models/grocery.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/app/dataStore.dart';

void main() {

  group('Groceries functionality:', () {

    test('successfully added a new grocery to the Groceries list', () {
      final _grocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: 7.0,
      );

      Groceries.create(_grocery);
      final _index = groceriesDummy.indexWhere((e) => e.id == _grocery.id);

      expect(_index, isNot( equals(-1) ));
    });

    test('successfully deleted an existing grocery from the Groceries list', () {
      final _grocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: 7.0,
      );

      Groceries.create(_grocery);
      Groceries.delete(_grocery.id);
      final _index = groceriesDummy.indexWhere((e) => e.id == _grocery.id);

      expect(_index, -1);
    });

    test('successfully edited an existing grocery from within the Groceries list', () {
      final _initialValue = 7.0;
      final _endValue = 9.0;

      final _initialGrocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: _initialValue,
      );

      final _endGrocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: _endValue,
      );

      Groceries.create(_initialGrocery);
      final indexOfInitial = groceriesDummy.indexWhere((e) => e.id == _initialGrocery.id);

      Groceries.edit(indexOfInitial, _endGrocery);
      final indexOfEnd = groceriesDummy.indexWhere((e) => e.id == _initialGrocery.id);

      expect(indexOfInitial, indexOfEnd);
      expect(groceriesDummy[indexOfInitial].quantity, _endValue);
      expect(groceriesDummy[indexOfInitial].id, _initialGrocery.id);
    });

    test('removed a grocery from the shopping basket', () {
      final _grocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: 7.0,
      );

      Groceries.create(_grocery);
      final _index = groceriesDummy.indexWhere((e) => e.id == _grocery.id);
      Groceries.removeFromBasket(_index);

      expect(groceriesDummy[_index].inBasket, false);
    });

    test('added a grocery to the shopping basket', () {
      final _grocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: 7.0,
      );

      Groceries.create(_grocery);
      final _index = groceriesDummy.indexWhere((e) => e.id == _grocery.id);
      Groceries.addToBasket(_index);

      expect(groceriesDummy[_index].inBasket, true);
    });

    test('successfully added a grocery to the inventory (Consumables) list', () {
      final _grocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: 7.0,
      );

      Groceries.create(_grocery);
      Groceries.addToInventory(_grocery.id);
      final _indexOfGrocery = groceriesDummy.indexWhere((e) => e.id == _grocery.id);
      final _indexOfConsumable = consumablesDummy.indexWhere((e) => e.id == _grocery.id);

      expect(_indexOfGrocery, -1);
      expect(_indexOfConsumable, isNot( equals(-1) ));
    });

    test('\'quick edited\' an existing grocery', () {
      final _initialValue = 7.0;
      final _endValue = 9.0;

      final _grocery = Grocery(
        productId: 'nil',
        name: 'cherreis',
        quantity: _initialValue,
      );

      Groceries.create(_grocery);
      final _index = groceriesDummy.indexWhere((e) => e.id == _grocery.id);
      Groceries.quickEdit(_index, _endValue);

      expect(groceriesDummy[_index].quantity, isNot( equals(_initialValue) ));
    });


  });
}