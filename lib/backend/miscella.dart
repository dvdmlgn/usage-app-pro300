import 'package:encrypt/encrypt.dart';
import './secrets.dart';

import 'package:flutter/material.dart';

String newId() {
  var x = DateTime.now().toIso8601String();
  return x;
}

String newTimestamp() {
  return DateTime.now().toString();
}

String encrypt(String content) {
  final encrypter = Encrypter(AES(encryptionKey));

  int length = content.length;
  int remainder = (length % 64).toInt();
  int pad = (remainder == 0) ? 0 : 64 - remainder;
  int rounds = (length / 64).ceil();

  content = content.padRight(64 * rounds, ' ');

  String cipher = '';
  int count = 0;

  while (true) {
    String slice = content.substring(count, count + 64);

    cipher += encrypter.encrypt(slice);

    count += 64;

    if (count >= length) {
      break;
    }
  }

  return cipher;
}

String decrypt(String cipher) {
  final encrypter = Encrypter(AES(encryptionKey));

  int length = cipher.length;

  String contents = '';
  int count = 0;

  while (true) {
    String slice = cipher.substring(count, count + 128);

    contents += encrypter.decrypt(slice);

    count += 128;
    if (count >= length) {
      break;
    }
  }

  contents = contents.trimRight();

  return contents;
}
