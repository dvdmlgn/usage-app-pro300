import './miscella.dart';

class Transaction {
  String id;
  String timestamp;
  String action;
  String oldState;
  String newState;

  Transaction({this.action, this.oldState, this.newState}) {
    id = newId();
    timestamp = newTimestamp();

    transactionLog.add(this);
  }

}

final transactionLog = <Transaction>[];

