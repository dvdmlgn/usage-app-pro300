import './miscella.dart';

class Transaction {
  String id;
  String timestamp;
  String action;
  String dataType;
  String oldState;
  String newState;

  Transaction({this.action, this.dataType, this.oldState, this.newState}) {
    id = newId();
    timestamp = newTimestamp();

    transactionLog.add(this);
  }

}

final transactionLog = <Transaction>[];

