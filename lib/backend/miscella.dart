// import 'package:encrypt/encrypt.dart';
import './secrets.dart';

// import 'package:flutter/material.dart';

import 'dart:convert';

String generateId({String dataType = 'not specified'}) {
  final _dataType = _stringToBase64(dataType);
  final _userId = _stringToBase64(userId);
  final _randomString = DateTime.now().toString();

  return '$_dataType.$_userId.$_randomString';
}

String generateTimestamp() {
  return DateTime.now().toString();
}


_stringToBase64(String text) {
  return base64Encode( latin1.encode(text) );
}