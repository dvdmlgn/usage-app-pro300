import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


class Biometric {
  static LocalAuthentication _biometricAuth;
  static bool canUseBiometric;
  static bool didAuthenticate;
  static var  availableBiometrics = <BiometricType>[];

  static init() async {
    _biometricAuth = LocalAuthentication();

    try {
      canUseBiometric     = await _biometricAuth.canCheckBiometrics;
      availableBiometrics = await _biometricAuth.getAvailableBiometrics();

      debugPrint(canUseBiometric.toString());
      debugPrint(availableBiometrics.toString());

    } on PlatformException catch (error) {
      print(error);
    }
  }


  static authenticate() async {
    didAuthenticate = await _biometricAuth.authenticateWithBiometrics(
      localizedReason: 'Please enter in your biometrics',
      stickyAuth: true,
      useErrorDialogs: true
    );

    debugPrint(didAuthenticate.toString());
  }


}




class Auth0 {
  
}