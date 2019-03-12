import 'package:flutter_test/flutter_test.dart';
import 'package:usage/models/consumable.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/backend/transactionLog.dart';

void main() {

  group('Consumables functionality:', () {

  test('consumable successfully added to Consumables list', () {
    var _consumable = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_consumable);

    final _index = consumablesDummy.indexWhere((e) => e.id == _consumable.id);

    // this needs to be changed to the normal consumalbes list
    expect(_index, isNot( equals(-1) ) );
  });

  test('an existing consumable has been successfully edited', () {
    var _initalConsumableState = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    var _editedConsumableState = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7,
      expiry: 'nil',
      description: 'very delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_initalConsumableState);

    var indexOfInitial = consumablesDummy.indexWhere((e) => e.id == _initalConsumableState.id);

    Consumables.edit(indexOfInitial, _editedConsumableState);

    var indexOfEdited = consumablesDummy.indexWhere((e) => e.id == _editedConsumableState.id);

    expect(indexOfInitial, isNot(equals(-1)) );
    expect(indexOfInitial, indexOfEdited);
    expect(consumablesDummy[indexOfInitial].id, _initalConsumableState.id);
  });

  test('an existing consumable has been successfully \'quick-edited\'', () {
    final _initialValue = 7.0;
    final _endValue = 9.0;

    final _consumable = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: _initialValue,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_consumable);
    final _index = consumablesDummy.indexWhere((e) => e.id == _consumable.id);
    Consumables.quickEdit(_index, _endValue);

    expect(consumablesDummy[_index].quantity, isNot( equals(_initialValue) ) );
  });

  test('an existing consumalbe has been successfully deleted', () {
    final _consumable = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7.0,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_consumable);
    final _index = consumablesDummy.indexWhere((e) => e.id == _consumable.id);
    Consumables.delete(_index);
    final _endIndex = consumablesDummy.indexWhere((e) => e.id == _consumable.id);

    expect(_endIndex, -1);
  });

  test('an existing consumalbe has been successfully consumed', () {
    final _consumable = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7.0,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_consumable);
    final _index = consumablesDummy.indexWhere((e) => e.id == _consumable.id);
    Consumables.consumed(_index);
    final _endIndex = consumablesDummy.indexWhere((e) => e.id == _consumable.id);

    expect(_endIndex, -1);
    expect(transactionLog.last.action, 'consumed');
  });

  test('an existing consumalbe has been successfully wasted', () {
    final _consumable = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7.0,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_consumable);
    final _index = consumablesDummy.indexWhere((e) => e.id == _consumable.id);
    Consumables.wasted(_index);
    final _endIndex = consumablesDummy.indexWhere((e) => e.id == _consumable.id);

    expect(_endIndex, -1);
    expect(transactionLog.last.action, 'wasted');
  });

  test('a consumable has been added to the shopping list', () {
    final _consumable = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7.0,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_consumable);
    final _index = consumablesDummy.indexWhere((e) => e.id == _consumable.id);
    Consumables.moveToShoppingList(_index);
    final _shoppingListIndex = groceries.indexWhere((e) => e.productId == _consumable.productId);

    expect(_shoppingListIndex, isNot( equals(-1) ));
  });

 });
}