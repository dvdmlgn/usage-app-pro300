import 'package:flutter_test/flutter_test.dart';
import 'package:usage/backend/transactionLog.dart';

void main() {
  group('add new transaction to transaction log:', () {

    test('transaction is successfully added to transaction log', () {

      Transaction(
        action:   'test',
        dataType: 'unit test',
        oldState: 'nil',
        newState: 'nil',
      );

    expect(transactionLog.length, 1);

    // transactionLog.removeLast();
    // print(transactionLog.length);
    });

    test('added transaction has correct & matching id', () {
      // transactionLog.clear();

      var _testTransaction = Transaction(
        action:   'test',
        dataType: 'unit test',
        oldState: 'nil',
        newState: 'nil',
      );

      expect(transactionLog.last.id, _testTransaction.id);

      // transactionLog.removeLast();
      // print(transactionLog.length);
    });


  });
}