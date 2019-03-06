import './miscella.dart';
import 'package:flutter/material.dart';

class Transaction {
  String id;
  String timestamp;
  String action;
  String dataType;
  String oldState;
  String newState;

  Transaction({this.action, this.dataType, this.oldState, this.newState}) {
    id = generateId();
    timestamp = generateTimestamp();
    transactionLog.add(this);

    transactionLog.forEach((t) {
      debugPrint(t.jsonify());
    });
  }

  String jsonify() {
    return {
      'id': id,
      'timestamp': timestamp,
      'action': action,
      'dataTypes': dataType,
      'oldState': oldState,
      'newState': newState
    }.toString();
  }
}

final transactionLog = <Transaction>[];
