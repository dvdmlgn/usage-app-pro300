import 'package:flutter_test/flutter_test.dart';
import 'package:usage/backend/transactionLog.dart';

void main() {
  group('add new transaction to transaction log:', () {

    test('transaction is successfully added to transaction log', () {
      transactionLog.clear();

      Transaction(
        action: 'test',
        dataType: 'unit test',
        oldState: 'nil',
        newState: 'nil',
      );

    expect(transactionLog.length, 1);
    });

    test('added transaction has correct & matching id', () {
      transactionLog.clear();

      var _testTransaction = Transaction(
        action: 'test',
        dataType: 'unit test',
        oldState: 'nil',
        newState: 'nil',
      );

      expect(transactionLog[0].id, _testTransaction.id);
    });


  });
}