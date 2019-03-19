import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';


class Biometrics {
  static LocalAuthentication _biometricAuth;

  static bool biometricsAreAvailable;
  static bool didSuccessfullyAuthenticate;
  static var  avaialableBiometrics = <BiometricType>[];

  static init() async {
    _biometricAuth = LocalAuthentication();

    try {
      biometricsAreAvailable = await _biometricAuth.canCheckBiometrics;
      avaialableBiometrics   = await _biometricAuth.getAvailableBiometrics();

    } on PlatformException catch (error) {
      print(error);
    }
  }

  static Future<bool> authenticate() async {
    final _didAuthenticate = await _biometricAuth.authenticateWithBiometrics(
      localizedReason: 'please enter your biometrics to sign in',
      stickyAuth: true,
      useErrorDialogs: true,
    );

    didSuccessfullyAuthenticate = _didAuthenticate;
    return _didAuthenticate;
  }


}