import 'package:encrypt/encrypt.dart';
import './secrets.dart';

import 'package:flutter/material.dart';

String newId() {

  return "hello there,..";
}

String newTimestamp() {

  return "hello there,..";
}

String encrypt(String content) {
  final encrypter = Encrypter( AES(encryptionKey) );

  int length = content.length;
  int remainder = (length % 64).toInt();
  int pad = (remainder == 0) ? 0 : 64 - remainder;
  int rounds = (length / 64).ceil();

  debugPrint("rounds: ${rounds}");

  debugPrint('content: ${content}');

  debugPrint('length: ${length}');
  debugPrint('remainder: ${remainder}');
  debugPrint('pad: ${pad}');

  content = content.padRight(64 * rounds, ' ');

  debugPrint('content padded: ${content}');
  debugPrint('padding lenght: ${content.length}');

  String cipher = '';
  int count = 0;

  while(true) {
    String slice = content.substring(count, count + 64);

    debugPrint("slice: ${slice}");

    debugPrint("slice length: ${slice.length}");

    cipher += encrypter.encrypt(slice);

    // cipher += "v";

    count += 64;

    debugPrint("count: ${count}");

    if (count >= length) { break; }
  }

  return cipher;
}

String decrypt(String cipher) {
  final encrypter = Encrypter( AES(encryptionKey) );

  int length = cipher.length;

  debugPrint("cipher length: ${cipher.length}");

  String contents = '';
  int count = 0;

  while(true) {
    String slice = cipher.substring(count, count + 128);

    contents += encrypter.decrypt(slice);

    count += 128;
    if (count >= length) { break; }
  }

  debugPrint("contents length: ${contents.length}");

  contents = contents.trimRight();

  debugPrint("contents length: ${contents.length}");

  return contents;
}