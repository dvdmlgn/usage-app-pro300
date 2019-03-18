import 'package:flutter_test/flutter_test.dart';
import 'package:usage/models/product.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/app/dataStore.dart';
// import 'package:usage/backend/transactionLog.dart';
import 'dart:async';

void main() {

  group('Products functionality:', () {

    test('successfully added a new product to the Products list', () {
      var _product = Product(
        name: 'cherry'
      );

      Products.add(_product);
      final _index = products.indexWhere((e) => e.id == _product.id);

      expect(_index, isNot(-1));
    });

    test('successfully edited an existing product within the Products list', () {
      var _product = Product(
        name: 'cherry'
      );

      Future.delayed(const Duration(milliseconds: 16), () => "1");

      Products.add(_product);
      final _index = products.indexWhere((e) => e.id == _product.id);

      var _edited = Product(
        name: 'peach'
      );

      Products.edit(_product.id, _edited);

      expect(products[_index].id, _product.id);
      expect(products[_index].name, isNot( _product.name ));
      expect(products[_index].name, _edited.name);
    });

    test('successfully deleted an existing products from the Products list', () {
      var _product = Product(
        name: 'cherry'
      );

      Products.add(_product);
      Products.delete(_product.id);
      final _index = products.indexWhere((e) => e.id == _product.id);

      expect(_index, -1);
    });


  });
}