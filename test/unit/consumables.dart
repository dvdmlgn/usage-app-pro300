import 'package:flutter_test/flutter_test.dart';
import 'package:usage/models/consumable.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/app/dataStore.dart';

void main() {

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
    final _initalConsumableState = Consumable(
      productId: 'nil',
      name: 'cherries',
      quantity: 7,
      expiry: 'nil',
      description: 'delicious',
      imageUrl: 'nil'
    );

    Consumables.add(_initalConsumableState);

    final _index = consumablesDummy.indexWhere((e) => e.id == _initalConsumableState.id);

    Consumables.quickEdit(_index, 9);

    expect(consumablesDummy[_index].quantity, isNot( equals(7) ) );
  });


}