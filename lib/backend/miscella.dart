import 'package:encrypt/encrypt.dart';
import './secrets.dart';

String newId() {

  return "hello there,..";
}

String newTimestamp() {

  return "hello there,..";
}

String encrypt(String content) {
  final encrypter = Encrypter( AES(encryptionKey) );

  return encrypter.encrypt(content);
}

String decrypt(String cipher) {
  final encrypter = Encrypter( AES(encryptionKey) );

  return encrypter.decrypt(cipher);
}